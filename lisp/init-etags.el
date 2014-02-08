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
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (when (buffer-file-name)
    (unless tags-table-list
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

(defun find-tags-sh-file ()
  (progn
    (defun find-tags-sh-file-r (path)
      "find the tags file from the parent directories"
      (let* ((parent (file-name-directory path))
	     (possible-tags-file (concat parent "tags.sh")))
	(cond
	 ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
	 ((string= "/tags.sh" possible-tags-file) (error "no tags.sh file found"))
	 (t (find-tags-sh-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it
          (find-tags-sh-file-r (buffer-file-name)))
      (error "buffer is not visiting a file")))
  )

(defun smart-create/build/make/update-tags ()
  (interactive)
  (eshell-command
   (find-tags-sh-file)))

(provide 'init-etags)
