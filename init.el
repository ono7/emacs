;; Silence warnings about obsolete functions
(setq byte-compile-warnings '((not obsolete))
      warning-suppress-types '((comp) (bytecomp)))

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                        ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;; install packages here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Basic settings
(setq inhibit-startup-message t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq initial-scratch-message nil)

;; GUI specific settings
(when (display-graphic-p)
  ;; Remove all decorations
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (set-frame-parameter nil 'undecorated t)
  ;(add-to-list 'default-frame-alist '(undecorated . t))
  (add-to-list 'default-frame-alist '(undecorated-round . t))
  
  ;; Set internal border to 15 pixels for a floating effect
  (set-frame-parameter nil 'internal-border-width 15)
  (add-to-list 'default-frame-alist '(internal-border-width . 15)))


;; project built in

(require 'project)

;; Theme setup
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  
  ;; Custom face overrides
  ;(custom-set-faces
  ; '(default ((t (:background "#1a1a1a" :foreground "#ffffff"))))
  ; '(font-lock-function-name-face ((t (:foreground "#e6b800"))))
  ; '(font-lock-keyword-face ((t (:foreground "#e6b800"))))
  ; '(font-lock-builtin-face ((t (:foreground "#e6b800"))))
  ; '(font-lock-string-face ((t (:foreground "#98c379"))))
  ; '(font-lock-comment-face ((t (:foreground "#666666"))))
  ; '(font-lock-variable-name-face ((t (:foreground "#ffffff"))))
  ; '(font-lock-type-face ((t (:foreground "#e6b800"))))
  ; '(font-lock-constant-face ((t (:foreground "#e6b800")))))
  )

;; Font settings
(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :font "Iosevka Custom"
                      :height 240
                      :weight 'regular))

;; Line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; macOS specific settings
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq ns-use-native-fullscreen t))

;; Evil mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; Terminal support
(use-package vterm
  :commands vterm)

;;;;;;;;;;;;;;;;;;;;;;;; command completion ;;;;;;;;;;;;;;;;;;;;;;

;; Install and configure Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  
  ;; Add some nice Evil-friendly keybindings
  :bind (:map vertico-map
              ("s-j" . vertico-next)
              ("s-k" . vertico-previous)
              ("s-l" . vertico-exit)
              ("s-h" . vertico-exit-delete)))

;; Optional but recommended: Install Marginalia for rich annotations
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Optional: Install Orderless for flexible completion matching
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; treesitter
(use-package treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))

;; Company mode
(use-package company
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode))

(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-saved-items 50)
  (setq recentf-max-menu-items 15)) 

;; General for keybindings
(use-package general
  :config
  (general-evil-setup)
  
  ;; macOS-style key bindings
  (general-define-key
   ;"s-s" 'save-buffer
   ;"s-c" 'kill-ring-save
   ;"s-v" 'yank
   ;"s-x" 'kill-region
   ;"s-z" 'undo
   ;"s-Z" 'undo-redo
   ;"s-a" 'mark-whole-buffer
   ;"s-f" 'swiper
   ;"s-w" 'delete-window
   ;"s-W" 'delete-frame
   ;"s-n" 'make-frame
   ;"s-}" 'next-buffer
   ;"s-{" 'previous-buffer
   "s-t" 'vterm
   "s-T" 'vterm-other-window
   "s-b" 'switch-to-buffer
   "s-p" 'project-find-file)

  ;; Window management
  (general-define-key
   "s-1" 'delete-other-windows
   "s-2" 'split-window-below
   "s-3" 'split-window-right
   "s-0" 'delete-window
   
   ;; Transparency controls
   ;"s-C-=" '(lambda () (interactive) (my/adjust-transparency 5))   ; Cmd + Ctrl + + to increase
   ;"s-C--" '(lambda () (interactive) (my/adjust-transparency -5))) ; Cmd + Ctrl + - to decrease

  ;; Completion key bindings
  (general-define-key
   :keymaps 'company-mode-map
   "s-i" 'company-complete
   "M-i" 'company-complete)

  (general-define-key
   :keymaps 'company-active-map
   "C-n" 'company-select-next
   "C-p" 'company-select-previous
   "C-h" 'company-show-doc-buffer
   "<tab>" 'company-complete-selection
   "RET" 'company-complete-selection))

;; LSP mode
(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-diagnostics-provider :none)  ; Disable diagnostics to reduce noise
  (lsp-enable-snippet nil)          ; Disable snippets
  :config
  ;; LSP key bindings
  (general-define-key
   :states '(normal insert)
   "s-k" 'lsp-signature-help           ; Cmd + k for signature help
   "s-h" 'lsp-describe-thing-at-point  ; Cmd + h for documentation
   "s-d" 'lsp-find-definition)         ; Cmd + d for go to definition
  
  (define-key lsp-mode-map (kbd "s-l") lsp-command-map))

;; Web mode with minimal configuration
(use-package web-mode
  :mode ("\\.html\\'" "\\.tsx\\'" "\\.jsx\\'")
  :custom
  (web-mode-enable-auto-pairing nil)
  (web-mode-enable-auto-closing nil)
  (web-mode-enable-current-element-highlight t))

;; Language modes
(use-package go-mode
  :hook (go-mode . lsp-deferred))

(use-package typescript-mode
  :hook (typescript-mode . lsp-deferred))

(use-package web-mode
  :mode ("\\.html\\'" "\\.tsx\\'")
  :hook (web-mode . lsp-deferred))

(use-package python
  :ensure nil
  :hook (python-mode . lsp-deferred))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

;; Enhanced fuzzy completion
(use-package consult
  :bind
  (("s-b" . consult-buffer)                  ; CMD+b for buffer switching
   ("s-r" . consult-recent-file)            ; CMD+r for recent files
   ("s-g" . consult-ripgrep)))              ; CMD+g for grep search

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1a1a1a" :foreground "#ffffff"))))
 '(font-lock-builtin-face ((t (:foreground "#e6b800"))))
 '(font-lock-comment-face ((t (:foreground "#666666"))))
 '(font-lock-constant-face ((t (:foreground "#e6b800"))))
 '(font-lock-function-name-face ((t (:foreground "#e6b800"))))
 '(font-lock-keyword-face ((t (:foreground "#e6b800"))))
 '(font-lock-string-face ((t (:foreground "#98c379"))))
 '(font-lock-type-face ((t (:foreground "#e6b800"))))
 '(font-lock-variable-name-face ((t (:foreground "#ffffff")))))

)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1a1a1a" :foreground "#ffffff"))))
 '(font-lock-builtin-face ((t (:foreground "#e6b800"))))
 '(font-lock-comment-face ((t (:foreground "#666666"))))
 '(font-lock-constant-face ((t (:foreground "#e6b800"))))
 '(font-lock-function-name-face ((t (:foreground "#e6b800"))))
 '(font-lock-keyword-face ((t (:foreground "#e6b800"))))
 '(font-lock-string-face ((t (:foreground "#98c379"))))
 '(font-lock-type-face ((t (:foreground "#e6b800"))))
 '(font-lock-variable-name-face ((t (:foreground "#ffffff")))))
