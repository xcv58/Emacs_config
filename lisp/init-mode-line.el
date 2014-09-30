(require-package 'smart-mode-line)
(require 'smart-mode-line)
(setq sml/theme 'respectful)
;; (sml/apply-theme 'dark)
;; (sml/apply-theme 'light)
;; (sml/apply-theme 'respectful)
;; (sml/apply-theme 'automatic)
(setq sml/no-confirm-load-theme t)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 25)
(setq sml/mode-width 'full)

;; (add-to-list 'sml/hidden-modes " AC")
;; (add-to-list 'sml/hidden-modes " Anzu")
;; (add-to-list 'sml/hidden-modes " Golden")
;; (add-to-list 'sml/hidden-modes " company")
;; (add-to-list 'sml/hidden-modes " Undo-Tree")
;; (add-to-list 'sml/hidden-modes " SP")
;; (add-to-list 'sml/hidden-modes " hs")
;; (add-to-list 'sml/hidden-modes " ws")
(add-to-list 'sml/replacer-regexp-list '("^~.*/Work/" ":Work:"))
; (add-to-list 'sml/hidden-modes " Gtags")
; (add-to-list 'sml/hidden-modes " Abbrev")
; (add-to-list 'sml/hidden-modes " Fill")
; (add-to-list 'sml/hidden-modes " Guide")
(sml/setup)

(setq display-time-string-forms
      '(24-hours ":" minutes ":" seconds)
      display-time-interval 1)

(display-time-mode 1)

;; (setq display-time-day-and-date t)
;;       display-time-interval 10
;;       display-time-24hr-format t)

(provide 'init-mode-line)
