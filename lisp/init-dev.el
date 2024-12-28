;; lisp/init-dev.el
;; TODO revisit these modes, check out the treesitter versions of ti
(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-diagnostics-provider :none)
  (lsp-enable-snippet nil)
  (lsp-enable-symbol-highlighting nil)
  (lsp-idle-delay 0.5)
  :config
  (general-define-key
   :states '(normal insert)
   "M-k" 'lsp-signature-help
   "M-h" 'lsp-describe-thing-at-point
   "M-d" 'lsp-find-definition))


(use-package web-mode
  :mode ("\\.html\\'" "\\.tsx\\'" "\\.jsx\\'")
  :custom
  (web-mode-enable-auto-pairing nil)
  (web-mode-enable-auto-closing nil)
  (web-mode-enable-current-element-highlight t))

;; (use-package go-mode
;;   :hook (go-mode . lsp-deferred))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GO STARTT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :preface
  (defun vd/go-lsp-start()
    (define-key go-ts-mode-map
		["RET"] 'newline-and-indent)
    (define-key go-ts-mode-map
		["M-RET"] 'newline)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (lsp-deferred)
    )
  :hook
  (go-ts-mode . vd/go-lsp-start)
  :custom
  (go-ts-mode-indent-offset 4)
  :config
  (add-to-list 'exec-path "~/.local/bin")
  (setq lsp-go-analyses '(
                          (nilness . t)
                          (shadow . t)
                          (unusedwrite . t)
                          (fieldalignment . t)
                          )
        lsp-go-codelenses '(
                            (test . t)
                            (tidy . t)
                            (upgrade_dependency . t)
                            (vendor . t)
                            (run_govulncheck . t)
                            )
        )
  )

(use-package go-tag
  :ensure t
  )

(use-package godoctor
  :ensure t
  )

;;;; GO END ;;;;;

(use-package lua-mode
  :hook (lua-mode . lsp-deferred))

(use-package typescript-mode
  :hook (typescript-mode . lsp-deferred))

(use-package python
  :ensure nil
  :hook (python-mode . lsp-deferred))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")


;; Auto focus compilation buffer
(add-hook 'compilation-finish-functions 'finish-focus-comp)
(add-hook 'compilation-start-hook 'finish-focus-comp)

(defun finish-focus-comp (&optional buf-or-proc arg2)
  (let* ((comp-buf (if (processp buf-or-proc)
                       (process-buffer buf-or-proc)
                     buf-or-proc))
         (window (get-buffer-window comp-buf)))
    (if window
        (select-window window)
      (switch-to-buffer-other-window comp-buf))))
