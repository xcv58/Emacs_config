(require-package 'ascope)
(require 'ascope)

(add-hook 'ascope-list-entry-hook 'turn-off-evil-mode)

(provide 'init-ascope)
