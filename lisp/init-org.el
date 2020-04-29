(require 'init-straight)

(straight-use-package 'org)
(straight-use-package 'org-cliplink)
(straight-use-package 'org-doing)
(straight-use-package 'org-dotemacs)
(straight-use-package 'org-mind-map)
(straight-use-package 'org-noter)
(straight-use-package 'ox-pandoc)
(straight-use-package 'org-agenda-property)
(straight-use-package 'org-plus-contrib)
(straight-use-package 'org-edna)


(defun init-org--capture-templates-append (templates)
  (require 'org-capture)
  (if (boundp 'org-capture-templates)
      (append org-capture-templates templates)
    templates))

(defun org-strip-quotes (string)
  "Strip double quotes from around STRING, if applicable.
If STRING is nil, return nil."
  (org-unbracket-string "\"" "\"" string))

(provide 'init-org)
