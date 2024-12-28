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

  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    (setq ns-use-native-fullscreen t))

  (general-define-key
   "M-b" 'switch-to-buffer
   "M-p" 'project-find-file)

  ;; Unbind super-p globally
  (global-unset-key (kbd "s-p"))
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

  ;; (general-define-key
  ;;  "M-1" 'delete-other-windows
  ;;  "M-2" 'split-window-below
  ;;  "M-3" 'split-window-right
  ;;  "M-0" 'delete-window)

  ;; Evil specific bindings
  (define-key evil-normal-state-map (kbd "U") 'undo-redo)
  (define-key evil-normal-state-map (kbd "s-i") 'evil-jump-forward)
  (define-key evil-normal-state-map (kbd "s-o") 'evil-jump-backward)
  (define-key evil-insert-state-map (kbd "s-<backspace>") 'backward-kill-word)


  ;; Enable super (command) key for minibuffer navigation
  (define-key evil-ex-completion-map (kbd "s-j") 'next-complete-history-element)
  (define-key evil-ex-completion-map (kbd "s-k") 'previous-complete-history-element)

  ;; For general minibuffer navigation
  (define-key minibuffer-local-map (kbd "s-j") 'next-line-or-history-element)
  (define-key minibuffer-local-map (kbd "s-k") 'previous-line-or-history-element)

  ;; For completion interfaces like ido or ivy (if you use them)
  (with-eval-after-load 'ivy
    (define-key ivy-minibuffer-map (kbd "s-j") 'ivy-next-line)
    (define-key ivy-minibuffer-map (kbd "s-k") 'ivy-previous-line))

  ;; For company-mode completion (if you use it)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "s-j") 'company-select-next)
    (define-key company-active-map (kbd "s-k") 'company-select-previous))

  ;; Buffer split navigation using super key
  (define-key evil-normal-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "s-l") 'evil-window-right)

  ;; Quick buffer switching
  (define-key evil-normal-state-map (kbd "s-b") 'switch-to-buffer)

  ;; If you're using vterm
  (with-eval-after-load 'vterm
    (define-key vterm-mode-map (kbd "s-h") 'evil-window-left)
    (define-key vterm-mode-map (kbd "s-j") 'evil-window-down)
    (define-key vterm-mode-map (kbd "s-k") 'evil-window-up)
    (define-key vterm-mode-map (kbd "s-l") 'evil-window-right))

  ;; For async-shell-command buffer
  (with-eval-after-load 'shell
    (define-key shell-mode-map (kbd "s-h") 'evil-window-left)
    (define-key shell-mode-map (kbd "s-j") 'evil-window-down)
    (define-key shell-mode-map (kbd "s-k") 'evil-window-up)
    (define-key shell-mode-map (kbd "s-l") 'evil-window-right))
  ;; delete buffer globably
  ;; (evil-define-key 'normal 'global (kbd "SPC d") 'kill-buffer)
  (evil-define-key 'normal 'global (kbd "SPC d") 'kill-current-buffer)

  )
