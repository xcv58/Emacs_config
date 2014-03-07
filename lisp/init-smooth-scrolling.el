(require-package 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)

(sublimity-global-mode)

(setq sublimity-scroll-weight 8
      sublimity-scroll-drift-length 1)
(setq sublimity-map-size 24)
(setq sublimity-map-fraction 0.5)
(setq sublimity-map-on-scroll t)

(sublimity-map-set-delay 32)

(add-hook 'sublimity-map-setup-hook
          (lambda ()
            (setq mode-line-format nil)))

(require-package 'smooth-scrolling)
(setq smooth-scroll-margin 4)


(provide 'init-smooth-scrolling)
