;; TODO: magit <next>
;; TODO: treesitter modes
;; TODO: Snippets
;; TODO: LSP completion and general maintenance 

;; useful for quickly debugging Emacs
;; (setq debug-on-error t)

(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

;; show path not symlink
(setq find-file-visit-truename t)

;; (load "init-modeline")
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
(load "init-magit")
(load "init-workspaces")
(load "init-lint")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs format-all lua-mode yaml-mode web-mode vterm vertico typescript-mode treesit-auto orderless marginalia lsp-mode go-mode general evil-commentary doom-themes dirvish consult company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1b1f31" :foreground "#cdd6f4"))))
 '(font-lock-builtin-face ((t (:foreground "#f9e2af"))))
 '(font-lock-comment-face ((t (:foreground "#666666"))))
 '(font-lock-constant-face ((t (:foreground "#f9e2af"))))
 '(font-lock-function-name-face ((t (:foreground "#cdd6f4"))))
 '(font-lock-keyword-face ((t (:foreground "#f9e2af"))))
 '(font-lock-string-face ((t (:foreground "#98c379"))))
 '(font-lock-type-face ((t (:foreground "#f9e2af"))))
 '(font-lock-variable-name-face ((t (:foreground "#cdd6f4")))))
