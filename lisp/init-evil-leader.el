(require-package 'evil-leader)

(global-evil-leader-mode)
;; (evil-leader/set-leader "\\")
;; (evil-leader/set-leader "<SPC>")
(evil-leader/set-leader "C-1")

(evil-leader/set-key
  "bf" 'beginning-of-defun
  "ef" 'end-of-defun
  "mf" 'mark-defun
  "eb" 'eval-buffer
  "ee" 'eval-expression
  "dj" 'dired-jump ;; open the dired from current file
  "k" 'kill-this-buffer
  "o" 'other-window
  "v" 'visual-line-witout-end
  "w" 'lookup-word-at-point
  "l" 'ido-downcase
  "u" 'ido-uppercase
  "c" 'ido-capitalize
  "y" 'ido-yank-line
  )

(evil-leader/set-key-for-mode
  'org-mode
  "p" 'org-latex-export-to-latex
  )

(defun ido-yank-line()
  (interactive)
  (evil-yank (line-first-non-blank-position) (line-end-position)))

(defun ido-downcase() (interactive) (apply-by-region 'downcase-region 'downcase-word))

(defun ido-uppercase() (interactive) (apply-by-region 'uppercase-region 'uppercase-word))

(defun ido-capitalize() (interactive) (apply-by-region 'capitalize-region 'capitalize-word))

(defun apply-by-region(fun-for-region fun-for-no-region)
  (if (use-region-p)
      (funcall fun-for-region (region-beginning) (region-end))
    (funcall fun-for-no-region 1)))

(provide 'init-evil-leader)
