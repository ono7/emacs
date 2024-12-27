;; lisp/init-utils.el
(use-package vterm
  :commands vterm)

(use-package dirvish
  :init
  (dirvish-override-dired-mode))

(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-saved-items 50)
  (setq recentf-max-menu-items 15))

(use-package consult
  :bind
  (("s-b" . consult-buffer)
   ("s-r" . consult-recent-file)
   ("s-g" . consult-ripgrep)))

(defun smart-curly-braces ()
  "Insert curly braces if previous character is '{'"
  (interactive)
  (if (eq (char-before) ?{)
      (progn
        (newline-and-indent)
        (newline-and-indent)
        (insert "}")
        (forward-line -1)
        (indent-according-to-mode))
    (newline-and-indent)))

(global-set-key (kbd "RET") #'smart-curly-braces)

(defun my/toggle-vterm ()
  "Toggle vterm buffer at the bottom"
  (interactive)
  (if (get-buffer "*vterm*")
      (if (string= (buffer-name) "*vterm*")
          (delete-window)
        (if (get-buffer-window "*vterm*")
            (delete-window (get-buffer-window "*vterm*"))
          (split-window-below)
          (other-window 1)
          (switch-to-buffer "*vterm*")))
    (split-window-below)
    (other-window 1)
    (vterm)))

(global-set-key (kbd "s-t") 'my/toggle-vterm)


(use-package savehist
  :defer 2
  :init
  (savehist-mode t)
  ;; So I can always jump back to wear I left of yesterday
  (add-to-list 'savehist-additional-variables 'global-mark-ring))


;;; popup window managment
(use-package popper
  :ensure t ; or :straight t
  :bind (("M-`"     . popper-toggle)
         ("M-~"     . popper-cycle)
         ("C-x M-`" . popper-toggle-type))
  :init
  (setopt popper-reference-buffers
          '("\\*Messages\\*"
            "\\*Warnings\\*"
            "\\*xref\\*"
            "\\*Backtrace\\*"
            "*Flymake diagnostics.*"
            "\\*eldoc\\*"
            "\\*compilation\\*"
            "\\*rustic-"
            "^*tex"
            "\\*Ement Notifications\\*"
            "Output\\*$"
            "\\*Async Shell Command\\*"
            "\\*Dtache Shell Command\\*"
            "\\*mu4e-update\\*"
            "\\*GDB.*out\\*"
            help-mode
            compilation-mode))
  (setopt popper-display-control t)
  (popper-mode +1))
