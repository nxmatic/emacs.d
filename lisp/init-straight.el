;; straigth package manager bootstrap

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defvar straight-recipes-nxmatic
  '("org-brain-export"
    '(org-brain-export :type git :flavor melpa :host github :repo "Kungsgeten/org-brain-export"))
  "local plist of recipes (inlined from init-straight)")
  
(defun straight-recipes-nxmatic-list (package)
  "local packages list from inlined repository source in init-straight"
  (cdr (assoc package (seq-partition straight-recipes-local 2)))

(defun straight-recipes-nxmatic-retrieve (package)
  "get recipe list from inlined repository source in init-straight"
  (plist-get straight-recipe-local package))

;; package compat
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; required deps
(straight-use-package 'w3m)

(provide 'init-straight)


