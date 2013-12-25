(require-package 'auctex)

(require-package 'latex-pretty-symbols)
(require 'latex-pretty-symbols)

(require-package 'auctex-latexmk)
(add-hook 'TeX-mode-hook
	  '(lambda () 
	     (push 
	      '("Latexmk" "latexmk -pvc -pdf %s" TeX-run-TeX nil t
		:help "Run Latexmk on file")
	      TeX-command-list)
	     (setq TeX-command-default "Latexmk")
	     (auto-complete-mode t)))

(when *is-a-mac*
  (getenv "PATH")
  (setenv "PATH"
	  (concat
	   "/usr/texbin" ":"
	   (getenv "PATH"))))
(setq exec-path (append exec-path '("/usr/local/bin")))


(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
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

(provide 'init-latex)
