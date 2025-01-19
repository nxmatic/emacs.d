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

(require 'init-xdg)
(require 'init-gnupg)
(require 'init-xdg)
(require 'init-display)
(require 'init-babel)
(require 'init-org)
(require 'init-org-gtd)
(require 'init-org-brain)
(require 'init-plantuml)
(require 'init-coding)
(require 'init-k8s)
(require 'init-slack)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3e2039156049bd0661317137a3761d4c2ff43e8a2aa423f6db0c0e8df0197492" "8d11daa5f67b21b377f159f12b47074e3dc706d03aa42dce90203f4516041448" "b2779867957a4b9de84bcd33c5ded92e943c710c4c5c5b7fc874786eaf63ca5c" "eb7cd622a0916358a6ef6305e661c6abfad4decb4a7c12e73d6df871b8a195f8" "d395c1793e0d64797d711c870571a0033174ca321ed48444efbe640bf692bf4f" "f82e68d489e6c21c9552c4e8e35a03d126d9eba632a8e7b4f9329d1374b4a19c" "4d844092dbec5c6fa347ca02c988ed99378b9e05de86a4d437de6370c78633df" "6c79c891ffc3120b4dfcb8440e808f12d7593a71cbe933c6ecb70290712c5156" "11873c4fbf465b956889adfa9182495db3bf214d9a70c0f858f07f6cc91cbd47" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(projectile-globally-ignored-directories
   '(".Amphetamine.DriveAlive" ".DS_Store" ".DocumentRevisions-V100" ".Spotlight-V100" ".TemporaryItems" ".Trashes" ".fseventsd"))
 '(safe-local-variable-values
   '((eval progn
	   (unless
	       (featurep 'jxlabs-nos/workspace)
	     (let*
		 ((this-directory
		   (locate-dominating-file default-directory ".dir-locals.el"))
		  (this-name
		   (file-name-base this-directory))
		  (this-lisp-directory
		   (expand-file-name ".elisp.d" this-directory)))
	       (push this-lisp-directory load-path)
	       (require 'jxlabs-nos/workspace)))
	   (jxlabs-nos/workspace/handle-buffer))
     (eval progn
	   (require 'init-coding-jxlabs-nos)
	   (init-coding-jxlabs-nos)
	   t)))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
