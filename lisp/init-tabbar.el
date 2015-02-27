(require-package 'tabbar-ruler)

(tabbar-ruler-move)
; If you want tabbar
(setq tabbar-ruler-global-tabbar t)
; if you want a global ruler
;; (setq tabbar-ruler-global-ruler t)
; If you want a popup menu.
(setq tabbar-ruler-popup-menu t)
; If you want a popup toolbar
(setq tabbar-ruler-popup-toolbar t)

; If you want to only show the
; scroll bar when your mouse is moving.
;; (setq tabbar-ruler-popup-scrollbar t)

(tabbar-ruler-group-user-buffers)

(global-set-key (kbd "C-`") 'tabbar-ruler-up)

(global-set-key (kbd "C-<tab>") 'tabbar-ruler-forward)
(global-set-key (kbd "C-S-<tab>") 'tabbar-ruler-backward)

(provide 'init-tabbar)
