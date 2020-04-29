(require 'init-straight)

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

(eval-after-load 'projectile
  '(progn
     (setq projectile-enable-caching t)
     (setq projectile-switch-project-action #'projectile-dired)
     (setq projectile-switch-project-action #'projectile-find-dir)
     (setq projectile-find-dir-includes-top-level t)
     (projectile-mode +1)
     t))

(eval-after-load 'persp-projectile
  '(progn
     (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)))

;; coding modes
(defun init-coding() 
  (persp-mode)
  t)

(straight-use-package 'yaml-mode)

(provide 'init-coding)

