(require 'init-straight)

;; disable tab globally
(progn
  (setq indent-tab-mode nil)
  (setq tab-width 2)
  (setq c-tab-width 2)
  (setq sh-basic-offset 2))

;; editor
(straight-use-package 'undo-tree)
;(straight-use-package 'auto-minor-mode)
(straight-use-package 'show-point-mode)

(use-package auto-minor-mode
  :after 'show-point-mode
  :config
  (add-to-list 'auto-minor-mode-alist '("\\.mk\\'" . show-point-mode)))

;; terraform
(straight-use-package 'terraform-mode)

;; markdown modes
(straight-use-package 'markdown-mode)
(straight-use-package 'markdown-mode+)
(straight-use-package 'markdown-preview-mode)

;; direnv
(use-package direnv ; direnv integration
  :straight t
  :after lsp
  :delight 'direnv-mode
  :config
  ;; Ensures that external dependencies are available before they are called.
  (add-to-list 'warning-suppress-types '(direnv))
  (add-hook 'prog-mode-hook #'direnv--maybe-update-environment)
  (setq direnv-always-show-summary t)
  (direnv-mode 1))

;; git modes
(straight-use-package
 '(compat             ;; required by magit git (obsolete)
   :type git
   :host github
   :repo "emacs-straight/compat"
   :files ("*" (:exclude ".git"))))

(straight-use-package 'magit)

(progn
	(straight-use-package 'magit-delta)
	(add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1))))

(straight-use-package 'magit-org-todos :config (direnv-mode))

;; dockerfile mode
(straight-use-package 'dockerfile-mode)

;; nix mode
(straight-use-package 'nix-mode)
(straight-use-package 'toml-mode)

;; lua mode (vim)
(straight-use-package 'lua-mode)


;; java jdee mode 
;; (straight-use-package 'jdee)

;; merge
(straight-use-package 'hydra)

(use-package smerge-mode
  :after hydra
  :config
  (defhydra unpackaged/smerge-hydra
    (:color pink :hint nil :post (smerge-auto-leave))
    "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("ZZ" (lambda ()
            (interactive)
            (save-buffer)
            (bury-buffer))
     "Save and bury buffer" :color blue)
    ("q" nil "cancel" :color blue))
  :hook (magit-diff-visit-file . (lambda ()
                                   (when smerge-mode
                                     (unpackaged/smerge-hydra/body)))))

(require 'smerge-mode)
;; project context

(straight-use-package 'shadowenv) 
(straight-use-package 'speedbar) ;; deps
(straight-use-package 'sift) ;; deps

;; projectile setup
(straight-use-package 'projectile)
(straight-use-package 'projectile-variable)
(straight-use-package 'projectile-git-autofetch)
(straight-use-package 'projectile-speedbar)
(straight-use-package 'projectile-sift)
(straight-use-package 'persp-projectile)

;; helm setup
(straight-use-package 'helm)

;; languages mode
(straight-use-package 'go-mode)
(straight-use-package 'groovy-mode)
(straight-use-package 'java-mode+)
(straight-use-package 'typescript-mode)
(straight-use-package 'yaml-mode)

(straight-use-package 'flycheck)
(straight-use-package 'flycheck-golangci-lint)

(with-eval-after-load 'projectile
  (progn
    (setq projectile-globally-ignored-directories
	  '(
	    ".Amphetamine.DriveAlive" ".DS_Store" ".DocumentRevisions-V100"
	    ".Spotlight-V100" ".TemporaryItems" ".Trashes" ".fseventsd"
	    ))
    (setq projectile-enable-caching t)
    (setq projectile-switch-project-action #'projectile-dired)
    (setq projectile-switch-project-action #'projectile-find-dir)
    (setq projectile-find-dir-includes-top-level t)
    (setq projectile-project-search-path '("/Volumes/GitHub")) ;; to rename (Projects)
    (global-set-key (kbd "C-x C-b") 'persp-list-buffers)
    (customize-set-variable 'persp-mode-prefix-key (kbd "C-c M-p"))
					; (projectile-discover-projects-in-search-path)(projectile-mode +1)
    (persp-mode)
    t))

(with-eval-after-load 'persp-projectile
  (progn
    (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)
    t))

(provide 'init-coding)
