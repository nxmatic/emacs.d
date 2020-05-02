(require 'init-straight)
(require 'init-org)

(straight-use-package 'org-brain)
;(straight-use-package 'org-brain-export)

(defun init-org-brain(directory) 
  (require 'org-brain)
  (setq-local org-brain-backlink t)
  (setq-local org-id-locations-file (expand-file-name ".org-id-locations" directory))
  (setq-local org-id-track-globally t)
  (require 'org-capture)
  (setq-local org-capture-templates
	      '(("b" "Brain" plain (function org-brain-goto-end)
		 "* %i%?" :empty-lines 1)))
  t)

(defun org-brain-open-org-noter (entry)
    "Open `org-noter' on the ENTRY.
If run interactively, get ENTRY from context."
    (interactive (list (org-brain-entry-at-pt)))
    (org-with-point-at (org-brain-entry-marker entry)
      (org-noter)))

(with-eval-after-load 'org-brain
  (progn
    (require 'org)
    (require 'org-noter)
    (require 'org-capture)
    (init-org-brain "~/brain")
    (add-hook 'before-save-hook 'org-brain-ensure-ids-in-buffer)
    (define-key org-brain-visualize-mode-map
      (kbd "\C-c n") #'org-brain-open-org-noter)
    t))

(provide 'init-org-brain)
