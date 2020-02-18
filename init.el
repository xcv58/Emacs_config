;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
(package-initialize)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin" "/usr/texbin")))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Path for eshell
;;----------------------------------------------------------------------------
;; (defun eshell-mode-hook-func ()
;;   (setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env))
;;   (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
;;   (define-key eshell-mode-map (kbd "M-s") 'other-window-or-split))
;; (add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages


;;----------------------------------------------------------------------------
;; Function for Specific Character
;;----------------------------------------------------------------------------
(require 'init-encoding)

;;----------------------------------------------------------------------------
;; Features
;;----------------------------------------------------------------------------
;;(require 'init-idle)
(require 'init-style)
(require 'init-evil)
(require 'init-evil-leader)
(require 'init-kill-ring)
(require 'init-dict)
;; (require 'init-tabbar)
(require 'init-multiple-cursors)

(require 'init-mode-line)
(require 'init-smooth-scrolling)
(require 'init-org)
(require 'init-latex)
(require 'init-git)
(require 'init-completing-statements)
(require 'init-gradle)
(require 'init-guide-key)
(require 'init-dired)               ;; Directory display and operation
(require 'init-ido)                 ;; InteractivelyDoThings
(require 'init-auto-complete)
;; (require 'init-company)
(require 'init-matlab)
(require 'init-vimrc)
;; (require 'init-ibuffer)
(require 'init-iedit)
(require 'init-yasnippet)
(require 'init-abbrev)
(require 'init-slime)
(require 'init-w3m)
(require 'init-smartparens)
(require 'init-expand-region)
(require 'init-whitespace)

(require 'init-prolog)
(require 'init-lua)
;; (require 'init-java)
(require 'init-js)

;; (require 'init-vc)
(require 'init-isearch)
;; (require 'init-cedet)
;; (require 'init-ecb)
;; (require 'init-ascope)
(require 'init-etags)
(require 'init-ag)

(require 'init-insert-continuous-numbers)

(require 'init-os161)

;; Config about theme and font and variable
;; Move down to avoid local setting overwrite theme setting
(require 'init-display-variable)
;; (require 'init-fill-column)

(require 'init-kbd)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'init-daemon)

(condition-case e
    (save-window-excursion (eval-buffer (browse-url-emacs "https://raw.githubusercontent.com/igb/tweemacs/master/tweemacs.el")))
  (error (message "Could not load tweemacs remote library: %s" (cadr e))))


;;; Show startup time
(message "init completed in %.2fms" (sanityinc/time-subtract-millis (current-time) before-init-time))
