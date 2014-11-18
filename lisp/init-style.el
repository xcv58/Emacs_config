(require-package 'google-c-style)
(add-hook 'c-mode-hook 'google-set-c-style)

(setq indent-tabs-mode nil)

(provide 'init-style)
