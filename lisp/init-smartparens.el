(require-package 'smartparens)
(require 'smartparens-config)
(require 'smartparens-latex)

(smartparens-global-mode t)
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "$" "$" :wrap "C-4")
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "{" "}" :wrap "C-{")
(sp-pair "{" "}" :wrap "C-}")
(sp-pair "\"" "\"" :wrap "C-\"")

(define-key sp-keymap (kbd "C-c ,") 'sp-up-sexp)
;; (define-key sp-keymap (kbd "M-e") 'sp-up-sexp)
(define-key sp-keymap (kbd "M-b") 'sp-backward-sexp)
(define-key sp-keymap (kbd "M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-c k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-c u") 'sp-unwrap-sexp)

(defun is-close-char (char)
  (member char '(?\( ?\) ?\] ?\, ? ?\$ ?\. ?\" ?\' ?\{ ?\})))

(defun end-of-this()
  (interactive)
  (unless (= (point) (line-end-position))
    ;; (message "%s" (buffer-substring-no-properties (point) (line-end-position)))
    (forward-char)
    (unless (is-close-char (char-before))
        (end-of-this))))

(define-key evil-insert-state-map "\C-e" 'end-of-this)
(define-key evil-insert-state-map "\M-e" 'end-of-line)

;; Removing pairs
(sp-pair "\$" nil :actions :rem)

(provide 'init-smartparens)
