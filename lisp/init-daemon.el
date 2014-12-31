(require 'server)

(unless (server-running-p)
  (server-start))

(defun uni-frame()
  (unless
      (find 'ns
            (mapcar #'(lambda (x) (if t (framep x))) (frame-list)))
    (make-frame '((window-system . ns)))))

(defun exist-ns-frame()
  (find 'ns
        (mapcar #'(lambda (x) (if t (framep x))) (frame-list))))

(setq pidfile "~/.emacs.pid")
(add-hook 'emacs-startup-hook
          (lambda ()
            (with-temp-file pidfile
              (insert (number-to-string (emacs-pid))))))
(add-hook 'kill-emacs-hook
          (lambda ()
            (when (file-exists-p pidfile)
              (delete-file pidfile))))

(provide 'init-daemon)
