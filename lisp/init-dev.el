;; lisp/init-dev.el
(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-diagnostics-provider :none)
  (lsp-enable-snippet nil)
  :config
  (general-define-key
   :states '(normal insert)
   "s-k" 'lsp-signature-help
   "s-h" 'lsp-describe-thing-at-point
   "s-d" 'lsp-find-definition))

(use-package web-mode
  :mode ("\\.html\\'" "\\.tsx\\'" "\\.jsx\\'")
  :custom
  (web-mode-enable-auto-pairing nil)
  (web-mode-enable-auto-closing nil)
  (web-mode-enable-current-element-highlight t))

(use-package go-mode
  :hook (go-mode . lsp-deferred))

(use-package typescript-mode
  :hook (typescript-mode . lsp-deferred))

(use-package python
  :ensure nil
  :hook (python-mode . lsp-deferred))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")
