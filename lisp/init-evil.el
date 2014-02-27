(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-matchit)
;; (require 'evil-matchit)
(global-evil-matchit-mode 1)

(evil-mode 1)
(setq evil-default-cursor t)
(global-evil-leader-mode)
(evil-leader/set-leader "\\")

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
  )

;; add hook hs-minor-mode for c-mode
;; add func hs-hide-all-comments
(add-hook 'c-mode-hook 'hs-minor-mode)
(define-key evil-normal-state-map "zh" 'hs-hide-all-comments)
(define-key evil-insert-state-map "\C-e" 'evil-end-of-visual-line)
(define-key evil-insert-state-map "\C-y" 'yank)

(defun visual-line-witout-end ()
  (interactive)
  (evil-first-non-blank)
  (evil-visual-char)
  (evil-last-non-blank))

(defun hs-hide-all-comments ()
  "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
  (interactive)
  (hs-life-goes-on
   (save-excursion
     (unless hs-allow-nesting
       (hs-discard-overlays (point-min) (point-max)))
     (goto-char (point-min))
     (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                         (point-min) (point-max)))
           (re (concat "\\(" hs-c-start-regexp "\\)")))
       (while (re-search-forward re (point-max) t)
         (if (match-beginning 1)
           ;; found a comment, probably
           (let ((c-reg (hs-inside-comment-p)))
             (when (and c-reg (car c-reg))
               (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
                   (hs-hide-block-at-point t c-reg)
                 (goto-char (nth 1 c-reg))))))
         (progress-reporter-update spew (point)))
       (progress-reporter-done spew)))
   (beginning-of-line)
   (run-hooks 'hs-hide-hook)))

(provide 'init-evil)
