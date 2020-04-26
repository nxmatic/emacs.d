(require 'init-straight)
(require 'init-org)

(straight-use-package 'org-brain)
(straight-use-package 'org-brain-export)


(require 'org)
(require 'org-noter)
(require 'org-brain)

(add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)

(let (key-binding ''("b" "Brain" plain (function org-brain-goto-end)
		 "* %i%?" :empty-lines 1))
  (if (boundp 'org-capture-template)
      (push key-binding org-capture-templates)
    (setq org-capture-template '(key-binding))))

(defun org-brain-open-org-noter (entry)
    "Open `org-noter' on the ENTRY.
If run interactively, get ENTRY from context."
    (interactive (list (org-brain-entry-at-pt)))
    (org-with-point-at (org-brain-entry-marker entry)
      (org-noter)))

(define-key org-brain-visualize-mode-map
  (kbd "\C-c n") #'org-brain-open-org-noter)

(provide 'init-org-brain)
