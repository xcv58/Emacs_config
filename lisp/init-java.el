(require-package 'malabar-mode)
(require 'malabar-mode)
(require 'cedet)

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode t)
;; (setq malabar-groovy-lib-dir "/usr/local/opt/groovy/libexec")

(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; (add-hook 'malabar-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'malabar-compile-file-silently
;;                       nil t)))

;; (add-hook 'malabar-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'malabar-install-project nil nil t)))

(provide 'init-java)
