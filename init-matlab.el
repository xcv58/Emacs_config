(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")

;(when *is-a-mac*
;  (message (getenv "PATH"))
;  (getenv "PATH")
;  (setenv "PATH"
;	  (concat (getenv "PATH")
;	   ":/Applications/MATLAB_R2013a.app/bin"
;	   ))
;  (message (getenv "PATH"))
;  )

;(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(provide 'init-matlab)
