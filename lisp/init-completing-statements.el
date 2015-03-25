;; need rewrite
;; 1. use regex to get whether need block
;; 2. support multiple type of language, i.e. C, Java, Python, JavaScript, json
(defun need-block()
  (line-first-non-blank)
  (member (thing-at-point 'word) '("if" "while" "for" "else" "switch" "def")))

(defun is-colon(char)
  (member char '(?\: )))

(defun is-semicolon(char)
  (member char '(?\; )))

(defun insert-end-char()
  (if (equal major-mode 'python-mode)
      (insert-nothing)
    (insert-semicolon)))

(defun insert-nothing()
  (end-of-line)
  (if (is-semicolon (char-before)) (delete-char -1))
  (newline)
  (indent-according-to-mode))

(defun insert-semicolon()
  (end-of-line)
  (if (is-semicolon (char-before))
      (newline)
    (insert ";"))
  (indent-according-to-mode))

(defun insert-c-style-block()
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

(defun insert-python-block()
  (end-of-line)
  (message (char-to-string (char-before)))
  (delete-trailing-whitespace)
  (unless (is-colon (char-before)) (insert ":"))
  (indent-according-to-mode)
  (newline)
  (indent-according-to-mode))

(defun insert-block()
  (if (equal major-mode 'python-mode)
      (insert-python-block)
    (insert-c-style-block)))

(defun complete-statement()
  (interactive)
  (if (need-block)
      (insert-block)
    (insert-end-char)))

(global-set-key (kbd "C-<return>") 'complete-statement)

(provide 'init-completing-statements)
