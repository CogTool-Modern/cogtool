;;; Loaded by probe-actr7.py after ACT-R 7, in a disposable Lisp process.
(defvar *cogtool-eye-starts* 0)
(defun emit-trace (module event)
  (unless (and (eq module :emma) (eq event 'prepare-eye-movement))
    (error "Unexpected eye-movement trace: ~s ~s" module event))
  (incf *cogtool-eye-starts*)
  (format t "~8,3f   EMMA   PREPARE-EYE-MOVEMENT~%" (mp-time)))

(load (merge-pathnames "cogtool-actr7-emma.lisp"
                       (pathname #+sbcl (sb-ext:posix-getenv "COGTOOL_LISP_DIR")
                                 #+clisp (ext:getenv "COGTOOL_LISP_DIR"))))

(unless (= (add-gaussian-noise 123 20) 123)
  (error "EMMA destination noise was not suppressed"))

(clear-all)
(define-model cogtool-emma-smoke
  (sgp :v t :trace-detail high :emma t :vis-obj-freq 0.01 :randomize-time nil)
  (chunk-type task state)
  (add-dm (start isa task state find))
  (goal-focus start)
  (p find-object
     =goal> isa task state find
     ==>
     =goal> state attend
     +visual-location> isa visual-location screen-x lowest)
  (p attend-object
     =goal> isa task state attend
     =visual-location>
     ==>
     =goal> state done
     +visual> cmd move-attention screen-pos =visual-location))

(reset)
(sgp-fct *cogtool-actr7-emma-parameters*)
(unless (and (first (sgp :emma)) (= (first (sgp :vis-obj-freq)) 0.01))
  (error "CogTool EMMA parameters were not applied"))
(let ((window (open-exp-window "EMMA smoke" :visible nil)))
  (add-text-to-exp-window window "X" :x 125 :y 150)
  (install-device window)
  (run 3))
(unless (> *cogtool-eye-starts* 0)
  (error "No EMMA eye-movement preparation was traced"))
(format t "~%ACT-R 7 EMMA adapter smoke test passed (~d eye movements).~%"
        *cogtool-eye-starts*)
