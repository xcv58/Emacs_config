(define-abbrev-table
  'global-abbrev-table '(
                         ("afaict" "as far as I can tell" nil 1)
                         ("omuse" "http://www.emacswiki.org/cgi-bin/oddmuse.pl" nil 0)
                         ("btw" "by the way" nil 3)
                         ("wether" "whether" nil 5)
                         ("ewiki" "http://www.emacswiki.org/cgi-bin/wiki.pl" nil 3)
                         ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

(provide 'init-abbrev)
