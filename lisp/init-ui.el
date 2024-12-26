;; lisp/init-ui.el
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t))

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :font "Iosevka Custom"
                      :height 240
                      :weight 'regular))

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(custom-set-faces
 '(default ((t (:background "#1b1f31" :foreground "#cdd6f4"))))
 '(font-lock-builtin-face ((t (:foreground "#f9e2af"))))
 '(font-lock-comment-face ((t (:foreground "#666666"))))
 '(font-lock-constant-face ((t (:foreground "#f9e2af"))))
 '(font-lock-function-name-face ((t (:foreground "#cdd6f4"))))
 '(font-lock-keyword-face ((t (:foreground "#f9e2af"))))
 '(font-lock-string-face ((t (:foreground "#98c379"))))
 '(font-lock-type-face ((t (:foreground "#f9e2af"))))
 '(font-lock-variable-name-face ((t (:foreground "#cdd6f4")))))
