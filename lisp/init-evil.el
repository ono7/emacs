;; lisp/init-evil.el
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; (use-package evil-numbers
;;   :ensure t
;;   :config
;;   (evil-define-key 'normal global-map
;;     (kbd "c-a") 'evil-numbers/inc-at-pt
;;     (kbd "c-x") 'evil-numbers/dec-at-pt
;;     (kbd "g s-a") 'evil-numbers/inc-at-pt-incremental
;;     (kbd "g s-x") 'evil-numbers/dec-at-pt-incremental))

(use-package general
  :config
  (general-evil-setup)

  ;; macOS specific bindings
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq ns-use-native-fullscreen t))

  (general-define-key
   "c-b" 'switch-to-buffer
   "c-p" 'project-find-file)

  (general-define-key
   "c-1" 'delete-other-windows
   "c-2" 'split-window-below
   "c-3" 'split-window-right
   "c-0" 'delete-window)

  ;; Evil specific bindings
  (define-key evil-normal-state-map (kbd "U") 'undo-redo)
  (define-key evil-normal-state-map (kbd "c-i") 'evil-jump-forward)
  (define-key evil-normal-state-map (kbd "c-o") 'evil-jump-backward)
  (define-key evil-insert-state-map (kbd "c-<backspace>") 'backward-kill-word)

  (define-key evil-normal-state-map (kbd "c-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "c-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "c-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "c-l") 'evil-window-right))
