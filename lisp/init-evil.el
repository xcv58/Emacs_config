(require-package 'evil)
(require-package 'evil-leader)

(evil-mode 1)
(setq evil-default-cursor t)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(provide 'init-evil)
