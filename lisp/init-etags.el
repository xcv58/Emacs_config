(require-package 'etags-select)

(setq tags-revert-without-query 1)

;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
    (if (buffer-file-name)
        (catch 'found-it
          (find-file-r (buffer-file-name) "TAGS"))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (when (buffer-file-name)
    (unless (member (jds-find-tags-file) tags-table-list)
      (setq tags-table-list
	    (cons (jds-find-tags-file)
		  tags-table-list)))))

(add-hook 'c-mode-hook
	  '(lambda() (jds-set-tags-file-path)))

(add-hook 'emacs-lisp-mode-hook
	  '(lambda() (jds-set-tags-file-path)))

;; delay search the TAGS file after open the source file
;; (add-hook 'emacs-startup-hook
;; 	  '(lambda () (jds-set-tags-file-path)))
(defun find-file-r (path filename)
      "find the tags file from the parent directories"
      (let* ((parent (file-name-directory path))
	     (possible-tags-file (concat parent filename)))
	(cond
	 ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
	 ((string= (concat "/" filename) possible-tags-file) (message "no %s file found" filename) (throw 'found-it nil))
	 (t (find-file-r (directory-file-name parent) filename)))))

(defun find-tags-sh-file ()
  (progn
    (if (buffer-file-name)
        (catch 'found-it
          (find-file-r (buffer-file-name) "tags.sh"))
      (error "buffer is not visiting a file"))))

(defun find-gitignore-file ()
  (progn
    (if (buffer-file-name)
        (catch 'found-it
          (find-file-r (buffer-file-name) ".gitignore"))
      (error "buffer is not visiting a file"))))

(defun smart-create/build/make/update-tags ()
  (interactive)
  (let ((script-file (find-tags-sh-file)))
    (if script-file
	(let ((command (format "%s %s" "sh" (find-tags-sh-file))))
	  (message "Run \"%s\"" command)
	  (eshell-command command)
	  (if (jds-find-tags-file)
	      (message "Successfully building TAGS: %s" (jds-find-tags-file))))
      (message "No tags.sh file found"))))

(provide 'init-etags)
