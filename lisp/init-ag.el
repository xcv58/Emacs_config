(require-package 'ag)
(require-package 'helm-ag)
(require-package 'helm-ag-r)

(setq ag-highlight-search t)

(global-set-key (kbd "C-x C-g") 'ag-project-regexp)

(provide 'init-ag)
