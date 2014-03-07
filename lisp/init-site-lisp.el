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

(defun eval-last-sexp (eval-last-sexp-arg-internal)
  "Evaluate sexp before point; print value in minibuffer.
Interactively, with prefix argument, print output into current buffer.
Truncates long output according to the value of the variables
`eval-expression-print-length' and `eval-expression-print-level'.

If `eval-expression-debug-on-error' is non-nil, which is the default,
this command arranges for all errors to enter the debugger."
  (interactive "P")
  (let ((point (point)))
  (if (= (point) (line-beginning-position))
      (evilmi-jump-items))
  (if (< (point) (line-end-position))
      (end-of-line))
  (if (null eval-expression-debug-on-error)
      (eval-last-sexp-1 eval-last-sexp-arg-internal)
    (let ((value
           (let ((debug-on-error eval-last-sexp-fake-value))
             (cons (eval-last-sexp-1 eval-last-sexp-arg-internal)
                   debug-on-error))))
      (unless (eq (cdr value) eval-last-sexp-fake-value)
        (setq debug-on-error (cdr value)))
      (car value)))
  (goto-char point)))

(provide 'init-site-lisp)
