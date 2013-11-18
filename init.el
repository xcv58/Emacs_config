;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path user-emacs-directory)
(require 'init-benchmarking) ;; Measure startup time


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;----------------------------------------------------------------------------
; Bootstrap config
;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages


;;----------------------------------------------------------------------------
;; Features
;;----------------------------------------------------------------------------
(require 'init-evil)


(require 'init-display)             ;; Config about theme and font
(require 'init-latex)
(require 'init-dired)               ;; Directory display and operation
(require 'init-ido)                 ;; InteractivelyDoThings
(require 'init-auto-complete)
(require 'init-matlab)


(require 'init-vc)
(require 'init-isearch)


;;----------------------------------------------------------------------------
;; Function for Specific Character
;;----------------------------------------------------------------------------
(require 'init-encoding)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;; Show startup time
(message "init completed in %.2fms" (sanityinc/time-subtract-millis (current-time) before-init-time))


