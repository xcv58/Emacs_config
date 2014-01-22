;;; Automatic resize windows
(require-package 'golden-ratio)
(golden-ratio-mode t)


;;; Theme
(require-package 'twilight-anti-bright-theme)
;(if window-system
;    (load-theme 'twilight-anti-bright t))
;  (load-theme 'manoj-dark t))
(load-theme 'twilight-anti-bright t)

;;; Default position
(setq default-frame-alist
      '(
	(top . 200)
	(left . 400)
	(width . 80)
	(height . 24)
	(cursor-type . box)
	(cursor-color . "#00ff00")))

(setq initial-frame-alist '((top . 0) (left . 30)))
(custom-set-variables
; (custom-enabled-themes (quote ("twilight-anti-bright" default)))
 '(tool-bar-mode nil)
 ;'(cursor-color "#52676f")
 )
;(set-cursor-color "#00ff00") 

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Monaco")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 300)
  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  ;; you may want to add different for other charset in this way.
  )

;; (set-frame-font "Monaco-28")

;;; Default cursor color
(set-cursor-color "#ffffff")

(setq
 default-directory "~/"
 inhibit-startup-message t
 ;; follow symlinks and don't ask
 blink-cursor-interval 1
 vc-follow-symlinks t
 display-time-24hr-format t
 display-time-day-and-date t
 )
(blink-cursor-mode t)

;;; bracket
(show-paren-mode t)

(column-number-mode t)

(size-indication-mode t)

(setq backup-directory-alist `(("." . "~/.saves-emacs")))

(setq system-uses-terminfo nil)
;;; opacity
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(80 64))
(add-to-list 'default-frame-alist '(alpha 80 64))

(setq-default initial-scratch-message
              (concat ";; Emacs is ready for you: " (or user-login-name "") "!\n\n"))
              ;(concat ";; Happy hacking " (or user-login-name "") "!\n\n"))

;;; Customize status bar
(require-package 'smart-mode-line)
(require 'smart-mode-line)
(setq sml/theme 'dark)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 25)
(setq sml/mode-width 'full)

(add-to-list 'sml/hidden-modes " AC")
(add-to-list 'sml/hidden-modes " Anzu")
(add-to-list 'sml/hidden-modes " Golden")
(add-to-list 'sml/hidden-modes " Undo-Tree")
(add-to-list 'sml/hidden-modes " SP")
(add-to-list 'sml/replacer-regexp-list '("^~.*/Work/" ":Work:"))
; (add-to-list 'sml/hidden-modes " Gtags")
; (add-to-list 'sml/hidden-modes " Abbrev")
; (add-to-list 'sml/hidden-modes " Fill")
; (add-to-list 'sml/hidden-modes " Guide")
(sml/setup)


;;----------------------------------------------------------------------------
;; Enable uniquify buffer name
;;----------------------------------------------------------------------------
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(provide 'init-display-variable)
