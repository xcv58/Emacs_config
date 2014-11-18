(require-package 'google-c-style)
;; (add-hook 'c-mode-hook 'google-set-c-style)

(setq c-default-style "k&r")
(setq indent-tabs-mode nil
      c-basic-offset 4)

(provide 'init-style)
