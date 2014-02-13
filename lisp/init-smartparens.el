(require-package 'smartparens)
(require 'smartparens-config)
(require 'smartparens-latex)

(smartparens-global-mode t)
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "{" "}" :wrap "C-{")
(sp-pair "{" "}" :wrap "C-}")
(sp-pair "\"" "\"" :wrap "C-\"")

(provide 'init-smartparens)
