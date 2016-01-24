(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(defun toggle-whitespace-linux-only ()
  (interactive)
  (if (and (boundp 'whitespace-mode) whitespace-mode)
      (whitespace-mode 0)
    (whitespace-toggle-options '(space-mark face))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (or (string-match (expand-file-name "~/src/")
                                           filename)
                             (string-match ".*os161.*"
                                           filename)
                             (string-match (expand-file-name "~/linux-master/")
                                           filename)))
                (setq indent-tabs-mode t)
                (ethan-wspace-mode 0)
                (whitespace-mode 0)
                (toggle-whitespace-linux-only)
                (linum-mode 1)
                (c-set-style "linux-tabs-only")))))

(provide 'init-os161)
