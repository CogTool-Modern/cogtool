;; Modern ACT-R 6 loader for CogTool
;; Compatible with CLISP, ECL, and other Common Lisp implementations

;; Detect LISP implementation and set appropriate options
#+clisp
(progn
  (setf *load-verbose* nil)
  (setf *compile-verbose* nil)
  (setf *load-print* nil)
  (setf *compile-print* nil)
  (setf *load-compiling* t)
  (setf *floating-point-contagion-ansi* t)
  (setf *warn-on-floating-point-contagion* nil))

#+ecl
(progn
  (setf *load-verbose* nil)
  (setf *load-print* nil))

#+sbcl
(progn
  (setf *load-verbose* nil)
  (setf *load-print* nil)
  (declaim (sb-ext:muffle-conditions sb-ext:compiler-note)))

;; Load ACT-R 6 and EMMA
(load "actr6/load-act-r-6.lisp")
