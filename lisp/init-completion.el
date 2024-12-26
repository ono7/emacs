;; lisp/init-completion.el
(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package company
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode))
