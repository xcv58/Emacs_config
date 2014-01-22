(require-package 'expand-region)
(require 'evil-leader)

(eval-after-load "evil" '(setq expand-region-contract-fast-key "z"))
(evil-leader/set-key "x" 'er/expand-region)

(provide 'init-expand-region)
