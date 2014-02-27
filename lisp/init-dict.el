(require 'thingatpt)

(defun lookup-word-at-point ()
  "Thanks to http://stackoverflow.com/users/182693/sean from http://stackoverflow.com/a/13411386/2989263"
  (interactive)
  (shell-command (format "dict %s" (shell-quote-argument (word-at-point)))))

(provide 'init-dict)
