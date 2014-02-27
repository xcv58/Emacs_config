(require-package 'browse-kill-ring)
(require-package 'popup-kill-ring)

(global-set-key "\C-cy"
                '(lambda ()
                   (interactive)
                   (popup-kill-ring)))

(provide 'init-kill-ring)
