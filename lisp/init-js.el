;; (require-package 'js3-mode)
(require-package 'js2-mode)

(setq js-indent-level 2)

(add-hook 'js-mode-hook 'js2-minor-mode)

(provide 'init-js)
