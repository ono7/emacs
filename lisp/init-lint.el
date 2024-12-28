(use-package flymake
  :hook ((python-mode . flymake-mode)
         (go-mode . flymake-mode)
         (typescript-mode . flymake-mode)
         (js-mode . flymake-mode)
         (yaml-mode . flymake-mode)))
