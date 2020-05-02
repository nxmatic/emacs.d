(require 'init-straight)

;; undo
(straight-use-package 'undo-tree)
  
;; git modes
(straight-use-package 'magit)
(straight-use-package 'magit-org-todos)

;; project context

(straight-use-package 'speedbar) ;; deps
(straight-use-package 'sift) ;; deps

;; projectile setup
(straight-use-package 'projectile)
(straight-use-package 'projectile-variable)
(straight-use-package 'projectile-git-autofetch)
(straight-use-package 'projectile-direnv)
(straight-use-package 'projectile-speedbar)
(straight-use-package 'projectile-sift)
(straight-use-package 'persp-projectile)

;; languages mode
(straight-use-package 'groovy-mode)
(straight-use-package 'java-mode+)
(straight-use-package 'typescript-mode)
(straight-use-package 'yaml-mode)

(with-eval-after-load 'projectile
  (progn
     (setq projectile-enable-caching t)
     (setq projectile-switch-project-action #'projectile-dired)
     (setq projectile-switch-project-action #'projectile-find-dir)
     (setq projectile-find-dir-includes-top-level t)
     (projectile-mode +1)
     (persp-mode)
     t))

(with-eval-after-load 'persp-projectile
  (progn
    (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)
    t))

(provide 'init-coding)

