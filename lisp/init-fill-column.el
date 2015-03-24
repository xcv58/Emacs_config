(require-package 'fill-column-indicator)
(setq fci-rule-width 1)
;; (setq fci-rule-color "red")

(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(provide 'init-fill-column)
