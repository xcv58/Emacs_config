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
(add-to-list 'sml/hidden-modes " company")
(add-to-list 'sml/hidden-modes " Undo-Tree")
(add-to-list 'sml/hidden-modes " SP")
(add-to-list 'sml/replacer-regexp-list '("^~.*/Work/" ":Work:"))
; (add-to-list 'sml/hidden-modes " Gtags")
; (add-to-list 'sml/hidden-modes " Abbrev")
; (add-to-list 'sml/hidden-modes " Fill")
; (add-to-list 'sml/hidden-modes " Guide")
(sml/setup)

(setq display-time-day-and-date t
      display-time-interval 10
      display-time-24hr-format t)
(display-time)

(provide 'init-mode-line)
