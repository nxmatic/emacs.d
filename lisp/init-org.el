(require 'init-straight)


(straight-use-package 'org)
(straight-use-package 'org-doing)
(straight-use-package 'org-dotemacs)
(straight-use-package 'org-noter)
(straight-use-package 'ox-pandoc)

(defun org-strip-quotes (string)
  "Strip double quotes from around STRING, if applicable.
If STRING is nil, return nil."
  (org-unbracket-string "\"" "\"" string))

(provide 'init-org)
