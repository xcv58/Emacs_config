;(defun chinese-encoding-current-buffer()
;  (interactive)
;  ;(revert-buffer-with-coding-system 'gbk t)
;  (let (
;  (let ((coding-system-for-read coding-system))
;    (revert-buffer-no-confirm)))
;  )
(defun chinese-encoding-current-buffer()
  (interactive)
  (revert-buffer-with-coding-system-no-confirm 'gbk)
  (set-buffer-file-coding-system 'utf-8))

(defun revert-buffer-with-coding-system-no-confirm (coding-system)
  "Call `revert-buffer-with-coding-system', but when `revert-buffer' do not need confirm."
  (interactive "zCoding system for visited file (default nil): ")
  (let ((coding-system-for-read coding-system)
        (point (point)))
    (revert-buffer t t)
    (goto-char point)))
    ;(revert-buffer-no-confirm)))

(defun revert-buffer-no-confirm ()
  (interactive)
  (let ((point (point)))
    (revert-buffer t t)
    (goto-char point)))

(provide 'init-encoding)
