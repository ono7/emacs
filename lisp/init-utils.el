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
  (("M-b" . consult-buffer)
   ("M-r" . consult-recent-file)
   ("M-f" . consult-fd)
   ("M-g" . consult-ripgrep)))

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


;; TODO: is this doing anything?
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

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package treemacs
  :ensure t
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode)
  :config
  (general-define-key
   :states 'normal
   "SPC b" 'treemacs))

;; better modeline...
;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :config
;;   (setq doom-modeline-icon nil)
;;   )

;; (use-package fzf
;;   ;; :bind
;;   ;; Add these to your .emacs or init.el file
;;   ;; :bind (("M-f" 'fzf-find-files)
;;   ;;        ("M-g" 'fzf-git-files)
;;   ;;        ("M-w" 'fzf-projectile))
;;   :init (setenv "FZF_DEFAULT_COMMAND" "fd --type f")
;;   :config

;;   ;; (define-key global-map (kbd "C-c f") #'fzf)
;;   ;; (define-key global-map (kbd "C-c d") #'fzf-directory)
;;   ;; (define-key global-map (kbd "C-c g") #'fzf-git-files)
;;   ;; (define-key global-map (kbd "C-c s") #'fzf-projectile)
;;   ;; (define-key global-map (kbd "C-c b") #'fzf-switch-buffer)
;;   (define-key global-map (kbd "M-f") #'fzf)
;;   (define-key global-map (kbd "M-d") #'fzf-directory)
;;   (define-key global-map (kbd "M-g") #'fzf-git-files)
;;   ;; (define-key global-map (kbd "C-c s") #'fzf-projectile)
;;   (define-key global-map (kbd "C-c b") #'fzf-switch-buffer)
;;   (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
;;         ;; fzf/executable "fzf"
;; 	fzf/executable "/Users/jlima/.fzf/bin/fzf"
;;         fzf/git-grep-args "-i --line-number %s"
;;         ;; command used for `fzf-grep-*` functions
;;         ;; example usage for ripgrep:
;;         fzf/grep-command "rg --no-heading -nH"
;;         ;; fzf/grep-command "grep -nrH"
;;         ;; If nil, the fzf buffer will appear at the top of the window
;;         fzf/position-bottom t
;;         fzf/window-height 15))
