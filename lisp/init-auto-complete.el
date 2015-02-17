(require-package 'auto-complete)
;; (require-package 'helm)
;; (require-package 'ac-helm)
(require-package 'ycmd)
(ycmd-setup)
(set-variable 'ycmd-server-command '("python" "/Users/xcv58/.emacs.d/elpa/ycmd/ycmd"))

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; (global-set-key (kbd "C-:") 'ac-complete-with-helm)


(provide 'init-auto-complete)
