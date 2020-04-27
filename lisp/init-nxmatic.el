(require 'init-straight)

(straight-use-recipes '(nxmatic :melpa nxmatic
				:type git
				:host github
				:repo "nxmatic/emacs-straight-nxmatic"))

(eval-after-load 'projectile
    '(progn
       (setq projectile-project-search-path '("~/" "~/Coding/nxmatic"))
       (projectile-discover-projects-in-search-path)))

(provide 'init-nxmatic)
