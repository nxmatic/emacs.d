(require 'init-coding)

(defvar jxlabs-nos-project-root "~/Coding/nxmatic/jxlabs-nos-helmboot-config")

(defun init-coding-jxlabs-nos()
  ;; coding
  (init-coding)

  (let ((book-directory (expand-file-name "book" jxlabs-nos-project-root)))

    ;; org-gtd
    (require 'init-org-gtd)
    (init-org-gtd (expand-file-name ".get-things-done" jxlabs-nos-project-root))
    
    ;; org-brain
    ;; (require 'init-org-brain)
    ;; (init-org-brain (expand-file-name .brain jxlabs-nos-project-root))
  t))
	    

(provide 'init-coding-jxlabs-nos)

