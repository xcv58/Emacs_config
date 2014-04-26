(require-package 'auctex)

;; (require-package 'latex-pretty-symbols)
;; (require 'latex-pretty-symbols)

(add-hook 'TeX-mode-hook
          '(lambda ()
             (setq TeX-command-default "Latexmk")))

(setq insert-latexmk nil)
(add-hook
 'LaTeX-mode-hook
 (lambda ()
   (unless insert-latexmk
     (push
      '("Latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
        :help "Run Latexmk on file")
      TeX-command-list)
     (setq insert-latexmk t))))

(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
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
        ("PDF Viewer" "open -a skim %o")
        ("Safari" "open %o")))

(provide 'init-latex)
