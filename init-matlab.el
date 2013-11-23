(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
					; (load-library "matlab-load")
(require 'matlab-load)

(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

(setq matlab-indent-function-body t)  ; if you want function bodies indented

(defun my-matlab-mode-hook ()
  (auto-complete-mode 1)
  ;; (auto-complete-mode t)
  (setq fill-column 76)
  )		; where auto-fill should wrap

(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  'my-matlab-mode-hook)
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)

;; (add-hook 'matlab-mode-hook
;; 	  '(lambda () 
;; 	     (message "test")
;; 	     (auto-complete-mode t)))

;; (when *is-a-mac*
;;  (message (getenv "PATH"))
;;  (getenv "PATH")
;;  (setenv "PATH"
;; 	  (concat (getenv "PATH")
;; 	   ":/Applications/MATLAB_R2013a.app/bin"
;; 	   ))
;;  (message (getenv "PATH"))
;;  )

;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(provide 'init-matlab)
