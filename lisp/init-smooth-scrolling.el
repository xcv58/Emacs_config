(require-package 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)

(sublimity-global-mode)

(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)
(setq sublimity-map-size 16)
(setq sublimity-map-fraction 0.4)
(setq sublimity-map-on-scroll t)

(sublimity-map-set-delay 10)

(add-hook 'sublimity-map-setup-hook
          (lambda ()
            (setq mode-line-format nil)
            ;; (scroll-bar-mode 1)
            ))

(provide 'init-smooth-scrolling)
