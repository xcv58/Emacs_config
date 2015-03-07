;; need rewrite
;; 1. use regex to get whether need block
;; 2. support multiple type of language, i.e. C, Java, Python, JavaScript, json
(defun need-block()
  (line-first-non-blank)
  (member (thing-at-point 'word) '("if" "while" "for" "else" "switch")))

(defun is-semicolon(char)
  (interactive)
  (member char '(?\; )))

(defun insert-semicolon()
  (end-of-line)
  (if (is-semicolon (char-before))
      (newline)
    (insert ";"))
  (indent-according-to-mode))

(defun insert-block()
  (end-of-line)
  (message (char-to-string (char-before)))
  (delete-trailing-whitespace)
  (insert " {")
  (newline)
  (newline)
  (insert "}")
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(defun complete-statement()
  (interactive)
  (if (need-block)
      (insert-block)
    (insert-semicolon)))

(global-set-key (kbd "C-<return>") 'complete-statement)

(provide 'init-completing-statements)
