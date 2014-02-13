(require-package 'smartparens)
(require 'smartparens-config)

(smartparens-global-mode t)
(sp-pair "(" ")" :wrap "C-(")
(sp-pair "(" ")" :wrap "C-)")
(sp-pair "{" "}" :wrap "C-{")
(sp-pair "{" "}" :wrap "C-}")
(sp-pair "\"" "\"" :wrap "C-\"")

(provide 'init-smartparens)
