(require 'init-straight)

(straight-use-package 'emamux)

;; (straight-use-recipes '(nxmatic :melpa nxmatic
;; 				:type git
;; 				:host github
;; 				:repo "nxmatic/emacs-straight-nxmatic"))

(require 'projectile)
(with-eval-after-load 'projectile
    (progn
      (setq projectile-project-search-path '("~/" "~/Coding/nxmatic"))
      (projectile-discover-projects-in-search-path)))

;; helm
(straight-use-package 'helm)

(require 'helm)

(provide 'init-nxmatic)
