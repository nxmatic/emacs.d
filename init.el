;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

;; Packages
;; Without this comment Emacs25 adds (package-initialize) here

(require 'init-display)
(require 'init-babel)
(require 'init-org)
(require 'init-org-brain)
(require 'init-programming)
(require 'init-nxmatic)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(safe-local-variable-values
   (quote
    ((eval progn
	   (setq-local org-id-track-globally t)
	   (setq-local org-id-locations-file
		       (expand-file-name ".org-id-locations"))
	   (setq-local org-brain-backlink t))
     (eval progn
	   (setq-local org-brain-path
		       (expand-file-name "."))
	   (setq-local org-id-locations-file
		       (expand-file-name ".org-id-locations" org-brain-path))
	   (setq-local org-brain-id-locations-file
		       (expand-file-name ".org-id-locations" org-brain-path))
	   (setq-local org-id-track-globally t)
	   (setq-local org-brain-backlink t))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
