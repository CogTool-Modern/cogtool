;; SBCL-compatible ACT-R 6 loader for CogTool
;; This replaces the CLISP-specific actr6.lisp

;; Set SBCL options for quiet loading
(setf *load-verbose* nil)
(setf *load-print* nil)

;; SBCL-specific settings
(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))

;; Disable package lock warnings for ACT-R compatibility
(sb-ext:unlock-package :sb-c)
(sb-ext:unlock-package :common-lisp)

;; Load ACT-R 6 and EMMA
(load "actr6/load-act-r-6.lisp")

;; Re-enable package locks
(sb-ext:lock-package :sb-c)
(sb-ext:lock-package :common-lisp)