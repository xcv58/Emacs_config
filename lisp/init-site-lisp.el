;;; Set load path

(eval-when-compile (require 'cl))
(defun sanityinc/add-subdirs-to-load-path (parent-dir)
  "Adds every non-hidden subdir of PARENT-DIR to `load-path'."
  (let* ((default-directory parent-dir))
    (progn
      (setq load-path
            (append
             (loop for dir in (directory-files parent-dir)
                   unless (string-match "^\\." dir)
                   collecting (expand-file-name dir))
             load-path)))))

(sanityinc/add-subdirs-to-load-path
 (expand-file-name "site-lisp/" user-emacs-directory))

;;; Utilities for grabbing upstream libs

(defun site-lisp-dir-for (name)
  (expand-file-name (format "site-lisp/%s" name) user-emacs-directory))

(defun site-lisp-library-el-path (name)
  (expand-file-name (format "%s.el" name) (site-lisp-dir-for name)))

(defun download-site-lisp-module (name url)
  (let ((dir (site-lisp-dir-for name)))
    (message "Downloading %s from %s" name url)
    (unless (file-directory-p dir)
      (make-directory dir)
      (add-to-list 'load-path dir))
    (let ((el-file (site-lisp-library-el-path name)))
      (url-copy-file url el-file t nil)
      el-file)))

(defun ensure-lib-from-url (name url)
  (unless (site-lisp-library-loadable-p name)
    (byte-compile-file (download-site-lisp-module name url))))

(defun site-lisp-library-loadable-p (name)
  "Return whether or not the library `name' can be loaded from a
source file under ~/.emacs.d/site-lisp/name/"
  (let ((f (locate-library (symbol-name name))))
    (and f (string-prefix-p (file-name-as-directory (site-lisp-dir-for name)) f))))


;; Download these upstream libs

(unless (> emacs-major-version 23)
  (ensure-lib-from-url
   'package
   "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el"))

(defun line-first-non-blank ()
  (interactive)
  (let ((point (point)))
    (back-to-indentation)
    (point)))

(defun eval-last-sexp (eval-last-sexp-arg-internal)
  " xcv58's version.
    If you already at end of line.
      It will eval sexp directly.
    If you are at middle of line.
      It will goto end of line and eval.
    If you are at the beginning of a sexp.
      It will try jump-items and eval.
   Tips: if you wanna eval whole function,
   you just need prevent your cursor located at beginning of line
     or the first non-blank char."
  (interactive "P")
  (let ((point (point)))
    (if (or (= (point) (line-beginning-position))
            (= point (line-first-non-blank)))
        (evil-jump-item)
      (if (< point (line-end-position))
          (end-of-line)))
    (if (null eval-expression-debug-on-error)
        (elisp--eval-last-sexp eval-last-sexp-arg-internal)
      (let ((value
             (let ((debug-on-error elisp--eval-last-sexp-fake-value))
               (cons (elisp--eval-last-sexp eval-last-sexp-arg-internal)
                     debug-on-error))))
        (unless (eq (cdr value) elisp--eval-last-sexp-fake-value)
          (setq debug-on-error (cdr value)))
        (car value)))
    (goto-char point)))

(provide 'init-site-lisp)
