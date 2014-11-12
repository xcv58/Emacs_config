(require-package 'pos-tip)
(require-package 'guide-key-tip)
(setq guide-key-tip/enabled t)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode
(setq guide-key/idle-delay 0.8)

(setq guide-key/guide-key-sequence '("C-x"))
(guide-key/add-local-guide-key-sequence "C-c")
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/highlight-command-regexp "rectangle\\|register")

(defun guide-key/my-hook-function-for-org-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-x")
  (guide-key/add-local-highlight-command-regexp "org-"))

(add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

(provide 'init-guide-key)
