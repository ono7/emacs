;; TODO: Snippets
;; TODO: magit
;; TODO: LSP completion and general maintenance

;; init.el
(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(load "init-core")
(load "init-package")
(load "init-evil")
(load "init-treesitter")
(load "init-ui")
(load "init-completion")
(load "init-keybinds")
(load "init-dev")
(load "init-utils")
(custom-set-variables
 '(package-selected-packages
   '(lua-mode yaml-mode web-mode vterm vertico typescript-mode treesit-auto orderless marginalia lsp-mode go-mode general evil-commentary doom-themes dirvish consult company)))
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
