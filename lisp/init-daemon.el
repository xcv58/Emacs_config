(require 'server)

(unless (server-running-p)
  (server-start))
(defun uni-frame()
(unless (find 'ns (mapcar #'(lambda (x) (if t (framep x))) (frame-list))) (make-frame '((window-system . ns)))))
(defun exist-ns-frame()
(find 'ns (mapcar #'(lambda (x) (if t (framep x))) (frame-list))))

(provide 'init-daemon)
