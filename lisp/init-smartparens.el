(require-package 'smartparens)
(require 'smartparens-config)
(require 'smartparens-latex)

(smartparens-global-mode t)
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "{" "}" :wrap "C-{")
(sp-pair "{" "}" :wrap "C-}")
(sp-pair "\"" "\"" :wrap "C-\"")

(define-key sp-keymap (kbd "C-c ,") 'sp-up-sexp)
(define-key sp-keymap (kbd "M-e") 'sp-up-sexp)
(define-key sp-keymap (kbd "M-b") 'sp-backward-sexp)
(define-key sp-keymap (kbd "M-f") 'sp-forward-sexp)

(provide 'init-smartparens)
