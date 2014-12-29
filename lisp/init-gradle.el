(require-package 'gradle-mode)
(require-package 'groovy-mode)

(gradle-mode 1)
(add-to-list 'auto-mode-alist '("gradle.build$" . groovy-mode))

(provide 'init-gradle)
