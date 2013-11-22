(require-package 'auctex)
(require-package 'latex-pretty-symbols)

(require 'latex-pretty-symbols)
(when *is-a-mac*
  ;(message (getenv "PATH"))
  (getenv "PATH")
  (setenv "PATH"
	  (concat
	   "/usr/texbin" ":"
	   (getenv "PATH")))
  ;(message (getenv "PATH"))
  )

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-PDF-mode t)
(setq TeX-save-query nil)
(setq TeX-view-program-selection
      '(((output-dvi style-pstricks)
         "dvips and PDF Viewer")
        (output-dvi "PDF Viewer")
        (output-pdf "PDF Viewer")
        (output-html "Safari")))
(setq TeX-view-program-list
      '(("dvips and PDF Viewer" "%(o?)dvips %d -o && open %f")
        ("PDF Viewer" "open %o")
        ("Safari" "open %o")))

;(eval-after-load 'latex (auto-complete-mode 1))
;(eval-after-load 'tex (ac-config-default))
;(add-hook 'prog-mode-hook #'auto-complete-mode)
;(defun open-auto-complete ()
;   (auto-complete-mode 1))
;(add-hook 'tex-mode-hook 'open-auto-complete)
;(add-hook 'prog-mode-hook 'turn-on-auto-fill)



(provide 'init-latex)
