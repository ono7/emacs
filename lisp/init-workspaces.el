(defvar my-workspaces '()
  "List of workspace absolute directory paths.")

(defvar my-workspaces-file (expand-file-name "~/.emacs.d/workspaces")
  "File to persist workspace directories.")

(defun my-load-workspaces ()
  "Load workspaces from file."
  (when (file-exists-p my-workspaces-file)
    (setq my-workspaces
          (with-temp-buffer
            (insert-file-contents my-workspaces-file)
            (read (current-buffer))))))

(defun my-save-workspaces ()
  "Save workspaces to file."
  (with-temp-file my-workspaces-file
    (prin1 my-workspaces (current-buffer))))

(defun my-add-workspace (dir)
  "Add a new workspace directory using its absolute path."
  (interactive "DAdd workspace: ")
  (let ((abs-dir (expand-file-name dir)))
    (unless (member abs-dir my-workspaces)
      (push abs-dir my-workspaces)
      (my-save-workspaces)
      (message "Added workspace: %s" abs-dir))))

(defun my-remove-workspace ()
  "Remove a workspace using completion."
  (interactive)
  (let ((workspace (completing-read "Remove workspace: " my-workspaces nil t)))
    (setq my-workspaces (delete workspace my-workspaces))
    (my-save-workspaces)
    (message "Removed workspace: %s" workspace)))

(defun my-switch-workspace ()
  "Switch to a workspace using fuzzy completion."
  (interactive)
  (when my-workspaces
    (let ((workspace (completing-read "Switch to workspace: " my-workspaces nil t)))
      (cd workspace)
      (message "Switched to workspace: %s" workspace))))

(defun my-add-current-workspace ()
  "Add the current directory as a workspace."
  (interactive)
  (let ((current-dir default-directory))
    (unless (member current-dir my-workspaces)
      (push current-dir my-workspaces)
      (my-save-workspaces)
      (message "Added current directory as workspace: %s" current-dir))))

;; Load workspaces when Emacs starts
(my-load-workspaces)

;; Key bindings
(evil-define-key 'normal 'global (kbd "SPC w a") 'my-add-workspace)
(evil-define-key 'normal 'global (kbd "SPC w r") 'my-remove-workspace)
;; (evil-define-key 'normal 'global (kbd "SPC w s") 'my-switch-workspace)
(evil-define-key 'normal 'global (kbd "M-w") 'my-switch-workspace)
(evil-define-key 'normal 'global (kbd "SPC w .") 'my-add-current-workspace)
