(defvar is-auto-org-to-latex 1)
(if (= is-auto-org-to-latex 1)
    (add-hook 'after-save-hook 'auto-export-to-latex))

(defun toggle-auto-export-to-latex ()
  (interactive)
  (setq is-auto-org-to-latex (mod (+ is-auto-org-to-latex 1) 2))
  (if (= is-auto-org-to-latex 0)
      (progn
        (remove-hook 'after-save-hook 'auto-export-to-latex)
        (setq is-auto-org-to-latex 0)
        (message "Disable auto export org to latex!"))
    (progn
      (add-hook 'after-save-hook 'auto-export-to-latex)
      (setq is-auto-org-to-latex 1)
      (message "Enable auto export org to latex!"))))

(defun auto-export-to-latex ()
  (if (string= major-mode "org-mode")
     (org-latex-export-to-latex)))

(provide 'init-org)
