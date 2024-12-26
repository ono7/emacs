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
