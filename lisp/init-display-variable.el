;;; Automatic resize windows
;; (require-package 'golden-ratio)
;; (golden-ratio-mode t)


;;; Theme
(require-package 'twilight-anti-bright-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
;(if window-system
;    (load-theme 'twilight-anti-bright t))
;  (load-theme 'manoj-dark t))

;; (defun apply-theme (frame)
;;   "Apply color theme to a frame based on whether its a 'real'
;;    window or a console window."
;;   (select-frame frame)
;;   (if (window-system frame)
;;       (load-theme 'sanityinc-solarized-dark t)
;;     (load-theme 'sanityinc-tomorrow-bright t)))

;; (add-hook 'after-make-frame-functions 'apply-theme)

(if window-system
    (color-theme-sanityinc-solarized-dark)
  (color-theme-sanityinc-tomorrow-bright))

;;; Default position
(setq default-frame-alist
      '(
        (fullscreen . maximized)
        ;; (top . 200)
        ;; (left . 400)
        ;; (width . 80)
        ;; (height . 24)
        (cursor-type . box)
        (cursor-color . "red")))

(setq linum-format "%4d\u2502")
;; (add-hook 'prog-mode-hook 'linum-mode)
(global-linum-mode t)

;; (setq initial-frame-alist '((top . 0) (left . 30)))

;;; Disable scroll bar
(scroll-bar-mode -1)

;;; Default Fullscreen
(defun maximize-frame ()
  (modify-frame-parameters
   nil
   `((fullscreen . ,'maximized))))

(global-set-key (kbd "C-c m") 'toggle-frame-maximized)
;; (setq mf-max-width 1900)
;; (require-package 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)
;; (add-hook 'after-make-frame-functions 'maximize-frame t)

;;; Disable tool bar
(custom-set-variables
 '(tool-bar-mode nil))

(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  ;; (set-face-attribute 'default nil :family "Monaco")
  ;; (set-face-attribute 'default nil :family "Source-Code-Pro")
  (set-face-attribute 'default nil :family "Inconsolata")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  (set-face-attribute 'default nil :height 300)
  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;; (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  (set-fontset-font t 'han (font-spec :family "Hiragino Sans GB" ))
  ;; (set-fontset-font (frame-parameter nil 'font) 'han (font-spec :family "Hiragino Sans GB" ))
  ;; you may want to add different for other charset in this way.
  )

(when (eq system-type 'gnu/linux)
  (set-face-attribute 'default nil :family "Inconsolata")
  (set-face-attribute 'default nil :height 200)
  (set-fontset-font t 'han (font-spec :family "Hiragino Sans GB" )))

;; (set-frame-font "Monaco-28")

;; make useless whitespace visible
(setq-default show-trailing-whitespace t)

;;; Default cursor color
;; (set-cursor-color "#ffffff")

(setq-default default-directory-list '("~/workspace/source" "~/work"))

(setq
 default-directory (car (remove-if-not #'file-exists-p (append default-directory-list '("~"))))
 inhibit-startup-message t
 ;; follow symlinks and don't ask
 blink-cursor-interval 1.5
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
(setq make-backup-files t)
(setq backup-by-copying t)
(setq backup-by-copying t)
(setq backup-by-copying-when-mismatch t)
(setq backup-by-copying-when-linked t)
(setq version-control t)
(setq-default delete-old-versions t)

;;; set size of recent/history items
(setq recentf-max-saved-items 1024)
(setq recentf-save-file "~/.recentf")

(setq system-uses-terminfo nil)

;;; Set opacity transparency
(defvar default-transparency '(89 89))
(set-frame-parameter (selected-frame) 'alpha default-transparency)
(add-to-list 'default-frame-alist (cons 'alpha default-transparency))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (if (or (not alpha)
            (= (car alpha) 100))
        (set-frame-parameter nil 'alpha default-transparency)
      (set-frame-parameter nil 'alpha '(100 100)))))

(defun transparency (value)
  "Sets the transparency of the frame window.\nInput a number no large than 100 means directly set the active transparency value.\nInput a number large than 100 means:\n  set (/ number 100) as active transparency value,\n  set (mod number 100) as inactive transparency number."
  (interactive "nTransparency value:" )
  (let ((transparency-value
         (if (> value 100)
             (list (/ value 100) (mod value 100))
           (cons (if (= value 0) 100 value) (cdr (frame-parameter nil 'alpha))))))
    (message "%s" transparency-value)
    (set-frame-parameter (selected-frame) 'alpha transparency-value)))

(global-set-key (kbd "C-c t") 'toggle-transparency)
(global-set-key (kbd "C-c c t") 'transparency)

;;; Initial message
(setq-default initial-scratch-message
              ())
              ;; (concat ";; Emacs is ready for you: " (or user-login-name "") "!\n\n"))
              ;(concat ";; Happy hacking " (or user-login-name "") "!\n\n"))

;; Turn off wrap lines
(set-default 'truncate-lines t)

;; Slower mouse/trackpad sroll speed
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;----------------------------------------------------------------------------
;; Enable uniquify buffer name
;;----------------------------------------------------------------------------
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(provide 'init-display-variable)
