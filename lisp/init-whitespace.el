(require-package 'ethan-wspace)
(global-ethan-wspace-mode 1)

(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        ;; (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        ;; (newline-mark 10 [182 10]) ; 10 LINE FEED
        ;; (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        (tab-mark 9 [183 9])))

(provide 'init-whitespace)
