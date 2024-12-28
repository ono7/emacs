;; lisp/init-mini-buffer-completion.el
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode))
