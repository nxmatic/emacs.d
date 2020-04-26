(require 'init-straight)

;; git modes
(straight-use-package 'magit)
(straight-use-package 'magit-org-todos)

;; project context

(straight-use-package 'speedbar) ;; deps
(straight-use-package 'sift) ;; deps

(straight-use-package 'projectile)
(straight-use-package 'projectile-variable)
(straight-use-package 'projectile-git-autofetch)
(straight-use-package 'projectile-direnv)
(straight-use-package 'projectile-speedbar)
(straight-use-package 'projectile-sift)

;; programming modes

(straight-use-package 'yaml-mode)

(provide 'init-programming)

