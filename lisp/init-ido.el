(require-package 'ido-vertical-mode)
(require-package 'ido-hacks)

;; Use C-f during file selection to switch to regular find-file
(ido-mode t)
(ido-everywhere t)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
(setq ido-enable-flex-matching t)
(setq ido-enable-prefix t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
(setq ido-save-directory-list-file "~/.ido.last")

(require-package 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(setq gc-cons-threshold 64000000)

(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'ido-ubiquitous)
  (ido-ubiquitous-mode t))

;; Use smex to handle M-x
(require-package 'smex)
(global-set-key [remap execute-extended-command] 'smex)
(setq smex-save-file "~/.smex-items")

(require-package 'idomenu)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(when (eval-when-compile (< emacs-major-version 24))
  (defun sanityinc/ido-choose-from-recentf ()
    "Use ido to select a recently opened file from the `recentf-list'"
    (interactive)
    (if (and ido-use-virtual-buffers (fboundp 'ido-toggle-virtual-buffers))
        (ido-switch-buffer)
      (find-file (ido-completing-read "Open file: " recentf-list nil t))))

  (global-set-key [(meta f11)] 'sanityinc/ido-choose-from-recentf))

(global-set-key (kbd "C-S-b") 'ido-switch-buffer)

(provide 'init-ido)
