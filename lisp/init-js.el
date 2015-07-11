;; (require-package 'js3-mode)
(require-package 'js2-mode)
(require-package 'json-reformat)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(setq js-indent-level 2)

;; (add-hook 'js-mode-hook 'js2-minor-mode)

(eval-after-load "js2-mode"
  '(progn
     (setq js2-missing-semi-one-line-override t)
     (setq-default
      js2-global-externs
      '("$"
        "module"
        "require"
        "buster"
        "sinon"
        "assert"
        "refute"
        "setTimeout"
        "clearTimeout"
        "setInterval"
        "json2html"
        "hljs"
        "clearInterval"
        "location"
        "Buffer"
        "__dirname"
        "console"
        "debug"
        "Meteor"
        "Template"
        "Npm"
        "_"
        "WebApp"
        "RoutePolicy"
        "CollectionAPI"
        "Session"
        "Router"
        "ReactiveMethod"
        "JSON"))
     (setq-default js2-basic-offset 2)))

(provide 'init-js)
