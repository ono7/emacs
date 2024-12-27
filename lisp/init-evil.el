;; lisp/init-evil.el

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (evil-define-key 'normal global-map
    (kbd "s-a") 'evil-numbers/inc-at-pt
    (kbd "s-x") 'evil-numbers/dec-at-pt
    (kbd "g s-a") 'evil-numbers/inc-at-pt-incremental
    (kbd "g s-x") 'evil-numbers/dec-at-pt-incremental))

(use-package general
  :after evil
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
  					  
  ;; (define-key evil-normal-state-map (kbd "s-h") 'evil-window-left)
  ;; (define-key evil-normal-state-map (kbd "s-j") 'evil-window-down)
  ;; (define-key evil-normal-state-map (kbd "s-k") 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "s-l") 'evil-window-right))

  )
