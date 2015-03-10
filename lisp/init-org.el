(defvar is-auto-org-to-latex t)
(if is-auto-org-to-latex
    (add-hook 'after-save-hook 'auto-export-to-latex))

(defun toggle-auto-export-to-latex ()
  (interactive)
  (if is-auto-org-to-latex
      (remove-hook 'after-save-hook 'auto-export-to-latex)
    (add-hook 'after-save-hook 'auto-export-to-latex))
  (setq is-auto-org-to-latex (not is-auto-org-to-latex))
  (message "%s auto export org to latex!" (if is-auto-org-to-latex "Enable" "Disable")))

(defun auto-export-to-latex ()
  (if (string= major-mode "org-mode")
     (org-latex-export-to-latex)))

(provide 'init-org)
