;; TODO: Snippets
;; TODO: formatting - needs hook for format on save, works manually
;; TODO: magit
;; TODO: LSP completion and general maintenance

(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(load "init-core")
(load "init-package")
(load "init-evil") ;; keymaps
(load "init-treesitter")
(load "init-ui")
(load "init-completion")
(load "init-dev")
(load "init-utils")
(load "init-formatting")
(load "init-theme")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(format-all lua-mode yaml-mode web-mode vterm vertico typescript-mode treesit-auto orderless marginalia lsp-mode go-mode general evil-commentary doom-themes dirvish consult company)))
