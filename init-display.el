(load-theme 'twilight-anti-bright t)
(custom-set-variables
; (custom-enabled-themes (quote ("twilight-anti-bright" default)))
 '(tool-bar-mode nil)
 ;'(cursor-color "#52676f")
 )
;(set-cursor-color "#00ff00") 

(set-frame-font "Monaco-28")

(setq default-frame-alist
      '((top . 200) (left . 400)
	(width . 80) (height . 24)
	(cursor-type . box)
	(cursor-color . "#00ff00")
	)
      )
(set-cursor-color "#ffffff")
(setq initial-frame-alist '((top . 0) (left . 30)))

(setq
 default-directory "~/"
 inhibit-startup-message t
 ;; follow symlinks and don't ask
 blink-cursor-interval 1
 vc-follow-symlinks t
 display-time-24hr-format t
 display-time-day-and-date t
)

;;; bracket
(show-paren-mode t)





(column-number-mode t)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(90 64))
(add-to-list 'default-frame-alist '(alpha 90 64))

(setq-default initial-scratch-message
              (concat ";; Emacs is ready for you: " (or user-login-name "") "!\n\n"))
              ;(concat ";; Happy hacking " (or user-login-name "") "!\n\n"))

(provide 'init-display)
