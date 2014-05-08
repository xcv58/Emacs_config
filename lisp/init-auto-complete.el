(require-package 'auto-complete)
;; (require-package 'helm)
;; (require-package 'ac-helm)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; (global-set-key (kbd "C-:") 'ac-complete-with-helm)


(provide 'init-auto-complete)
