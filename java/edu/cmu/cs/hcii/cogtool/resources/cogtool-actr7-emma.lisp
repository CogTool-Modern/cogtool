;;; Experimental ACT-R 7 EMMA adapter.  Load after ACT-R and before defining
;;; the model; the caller must provide CogTool's EMIT-TRACE function.
;;; This file is not used by the ACT-R 6 prediction runtime.

;;; ACT-R 7.27.7's REQUIRE-EXTRA probes a directory pathname, which CLISP
;;; rejects.  Load its normal entry point directly when it is not already in
;;; the image; EMMA's PROVIDE form records it in *MODULES*.
(unless (member "emma" *modules* :test #'string-equal)
  (load (translate-logical-pathname "ACT-R:extras;emma;emma.lisp")))

;;; ACT-R 7 changes EMMA's default visual-object frequency from 0.01 to 0.1.
;;; Supply these defaults when constructing the model, before applying any
;;; user-specified parameter overrides.
(defparameter *cogtool-actr7-emma-parameters*
  '(:emma t :visual-encoding-factor 0.006 :visual-encoding-exponent 0.4
    :vis-obj-freq 0.01 :randomize-time nil))

;;; CogTool's ACT-R 6 integration suppresses noise in saccade destinations.
;;; ACT-R 7 EMMA still uses this function for that purpose.
(defun add-gaussian-noise (mean standard-deviation)
  (declare (ignore standard-deviation))
  mean)

;;; CLISP signals DIVISION-BY-ZERO for (atan 0 0), which upstream EMMA can
;;; reach when it prepares another saccade to the eye's current position.
;;; Use the same destination and timing calculations, with an arbitrary zero
;;; direction for that zero-distance movement.
#+clisp
(defmethod compute-saccade-r-theta :around
    ((emma emma-vis-mod) (start-loc vector) (end-loc vector))
  (if (and (= (px start-loc) (px end-loc))
           (= (py start-loc) (py end-loc)))
      (let* ((destination (vector (round (px end-loc))
                                  (round (py end-loc))
                                  (pz end-loc)))
             (movement (make-instance 'saccade
                         :r (angle-between-vectors start-loc destination)
                         :theta 0 :new-loc destination)))
        (setf (fprep-time movement)
              (randomize-time (compute-prep-time emma movement)))
        (setf (exec-time movement) (compute-exec-time emma movement))
        movement)
    (call-next-method)))

;;; Preparation and completion events are emitted by the EMMA module in
;;; ACT-R 7. Emit the corresponding start marker in that same module.
(defmethod initiate-eye-move :before
    ((emma emma-vis-mod) (recognition-time number) (movement saccade))
  (declare (ignore emma recognition-time movement))
  (emit-trace :emma 'prepare-eye-movement))
