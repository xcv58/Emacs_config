(require-package 'evil)
(require-package 'evil-leader)

(evil-mode 1)
(setq evil-default-cursor t)
(global-evil-leader-mode)
(evil-leader/set-leader "\\")

(evil-leader/set-key ;; 
  "bf" 'beginning-of-defun
  "ef" 'end-of-defun
  "mf" 'mark-defun
  "eb" 'eval-buffer
  "ee" 'eval-expression
  "dj" 'dired-jump ;; open the dired from current file
  "k" 'kill-this-buffer
  "o" 'other-window
  )


(provide 'init-evil)
