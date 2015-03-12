(require-package 'auto-complete)
(require-package 'fuzzy)

;; (require-package 'ycmd)
;; (ycmd-setup)
;; (set-variable 'ycmd-server-command '("python" "/Users/xcv58/.emacs.d/elpa/ycmd/ycmd"))

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-menu-map "\C-s" 'ac-isearch)

(setq ac-menu-height 8)
(setq ac-ignore-case 'smart)

(provide 'init-auto-complete)
