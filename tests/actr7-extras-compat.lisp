;;; Probe ACT-R 7.27.7's extended motor and ACT-Touch modules together.
;;; The test deliberately uses their shipped demo; it is not a CogTool model.

;;; Direct loading avoids REQUIRE-EXTRA's CLISP directory-probe issue.
(load (translate-logical-pathname
       "ACT-R:extras;extended-motor-actions;motor-extension.lisp"))
(provide "extended-motor-actions")
(load (translate-logical-pathname "ACT-R:extras;act-touch;act-touch.lisp"))
(load (translate-logical-pathname "ACT-R:extras;act-touch;touch-demo-model.lisp"))

(defvar *cogtool-touch-tap-observed* nil)
(defun cogtool-observe-touch-tap (model hand finger x y)
  (declare (ignore model hand finger x y))
  (setf *cogtool-touch-tap-observed* t))
(add-act-r-command "cogtool-test-touch-tap" 'cogtool-observe-touch-tap
                   "Observe a tap in the extras compatibility probe.")
(monitor-act-r-command "touch-tap" "cogtool-test-touch-tap")

;;; Test their default single-stage configuration explicitly.
(sgp :dual-execution-stages nil :dual-processor-stages nil)
(run-touch-demo t)
(unless *cogtool-touch-tap-observed*
  (error "The touch demo did not produce a tap notification"))
(remove-act-r-command-monitor "touch-tap" "cogtool-test-touch-tap")
(remove-act-r-command "cogtool-test-touch-tap")
(format t "~%ACT-Touch and extended motor actions compatibility probe passed.~%")
