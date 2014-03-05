(require-package 'ascope)
(require 'ascope)

(add-hook 'ascope-list-entry-hook 'turn-off-evil-mode)

(defun smart-ascope-init ()
  (interactive)
  (let ((project-directory
         (progn
           (if (buffer-file-name)
               (catch 'found-it (find-file-r (buffer-file-name) ".gitignore"))
             (error "buffer is not visiting a file")))))
    (if project-directory
        (ascope-init (file-name-directory project-directory)))))

(provide 'init-ascope)
