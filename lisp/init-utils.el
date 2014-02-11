(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;;----------------------------------------------------------------------------
;; Default warp line in org-mode
;;----------------------------------------------------------------------------
(add-hook 'org-mode-hook 'toggle-truncate-lines t)


;;----------------------------------------------------------------------------
;; Default hide initial comment block
;;----------------------------------------------------------------------------
(add-hook 'c-mode-hook 'hs-hide-initial-comment-block)

;;----------------------------------------------------------------------------
;; Set command key as control
;;----------------------------------------------------------------------------
(setq mac-command-modifier 'control)

;;----------------------------------------------------------------------------
;; Set C-return to toggle fullscreen
;;----------------------------------------------------------------------------
(global-set-key (kbd "C-<return>") 'toggle-frame-fullscreen)

;;----------------------------------------------------------------------------
;; Copy current buffer file name as kill
;;----------------------------------------------------------------------------
(global-set-key (kbd "C-c C-f") 'copy-current-buffer-filename-as-kill)

(defun copy-current-buffer-filename-as-kill ()
  (interactive)
  (when (buffer-file-name) (kill-new (buffer-file-name)))
	(message "%s" (buffer-file-name)))

;;----------------------------------------------------------------------------
;; Key Bind C-s and C-r to regex search, C-M-s and C-M-r to normal search
;;----------------------------------------------------------------------------
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;;----------------------------------------------------------------------------
;; C-x C-k to kill-this-buffer
;;----------------------------------------------------------------------------
(global-set-key [(control x) (control k)] 'kill-this-buffer)

;;----------------------------------------------------------------------------
;; Key to switch between tabs,
;;----------------------------------------------------------------------------
(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*"))

(defun my-next-buffer ()
  "next-buffer that skips certain buffers"
  (interactive)
  (next-buffer)
  (while (member (buffer-name) skippable-buffers)
    (next-buffer)))

(defun my-previous-buffer ()
  "previous-buffer that skips certain buffers"
  (interactive)
  (previous-buffer)
  (while (member (buffer-name) skippable-buffers)
    (previous-buffer)))

; (defun my-next-buffer ()
;   "next-buffer, skip all *.**"
;   (interactive)
;   (next-buffer)
;   (while (string-match "\\*.*\\*" (buffer-name))
;     (next-buffer)))
;
; (defun my-previous-buffer ()
;   "previous-buffer, skip all *.**"
;   (interactive)
;   (previous-buffer)
;   (while (string-match "\\*.*\\*" (buffer-name))
;     (previous-buffer)))

(global-set-key (kbd "C-<tab>") 'my-next-buffer)
(global-set-key (kbd "C-S-<tab>") 'my-previous-buffer)


;;----------------------------------------------------------------------------
;; Enable uniquify buffer name
;;----------------------------------------------------------------------------
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")


;;----------------------------------------------------------------------------
;; Make all yes or no to y or n
;;----------------------------------------------------------------------------
(fset 'yes-or-no-p 'y-or-n-p)


;;----------------------------------------------------------------------------
;; Save place
;;----------------------------------------------------------------------------
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.saved-places-emacs")


;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (when (file-exists-p filename)
         (rename-file filename new-name 1))
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (tramp-tramp-file-p file-name)
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))


(provide 'init-utils)
