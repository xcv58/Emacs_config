;;----------------------------------------------------------------------------
;; Key Bind C-/ to comment Do What I Mean
;;----------------------------------------------------------------------------
(require-package 'bind-key)
(bind-key* "C-/" 'comment-dwim)

(provide 'init-kbd)
