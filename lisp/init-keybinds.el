(use-package general
  :config
  (general-evil-setup)

  ;; macOS specific bindings
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq ns-use-native-fullscreen t))

  (general-define-key
   "s-b" 'switch-to-buffer
   "s-p" 'project-find-file)

  (general-define-key
   "s-1" 'delete-other-windows
   "s-2" 'split-window-below
   "s-3" 'split-window-right
   "s-0" 'delete-window)

  ;; Evil specific bindings
  (define-key evil-normal-state-map (kbd "U") 'undo-redo)
  (define-key evil-normal-state-map (kbd "s-i") 'evil-jump-forward)
  (define-key evil-normal-state-map (kbd "s-o") 'evil-jump-backward)
  (define-key evil-insert-state-map (kbd "s-<backspace>") 'backward-kill-word)

  (define-key evil-normal-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "s-l") 'evil-window-right))

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
