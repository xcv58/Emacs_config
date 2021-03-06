(require-package 'evil)

(evil-mode 1)
(setq evil-default-cursor t)

(define-key evil-motion-state-map (kbd "C-b") 'evil-scroll-up)

;; remap 0 to evil-first-non-blank
(defun line-first-non-blank-position ()
  (let* ((point (point))
         (first-non-blank-position (progn (evil-first-non-blank) (point))))
    (goto-char point)
    first-non-blank-position))

(defun evil-first-non-blank-or-beginning-of-line ()
  (interactive)
  (if (= (point) (line-first-non-blank-position))
      (evil-beginning-of-line)
    (evil-first-non-blank)))

(evil-redirect-digit-argument evil-motion-state-map "0" 'evil-first-non-blank-or-beginning-of-line)
(define-key evil-motion-state-map "^" 'evil-beginning-of-line)
;; add hook hs-minor-mode for c-mode
;; add func hs-hide-all-comments
(add-hook 'c-mode-hook 'hs-minor-mode)
(define-key evil-normal-state-map "zh" 'hs-hide-all-comments)
;; (define-key evil-insert-state-map "\C-e" 'evil-end-of-visual-line)
(define-key evil-insert-state-map "\C-y" 'yank)

(evil-define-command evil-toggle-fold ()
  "Open or close a fold."
  (let ((point (point)))
    (end-of-line)
    (when (fboundp 'hs-minor-mode)
      (hs-minor-mode 1)
      (with-no-warnings (hs-toggle-hiding)))
    (goto-char point)))

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

(evil-define-operator evil-indent (beg end)
  "Indent text."
  :move-point nil
  :type line
  (if (and (= beg (line-beginning-position))
           (= end (line-beginning-position 2)))
      ;; since some Emacs modes can only indent one line at a time,
      ;; implement "==" as a call to `indent-according-to-mode'
      (indent-according-to-mode)
    (goto-char beg)
    (indent-region beg end))
  (back-to-indentation)
  (forward-line))
(define-key evil-normal-state-map "=" 'evil-indent)

(provide 'init-evil)
