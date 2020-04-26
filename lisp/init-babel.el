(require 'init-straight)


(straight-use-package 'babel)

(require 'babel)
(require 'ob-shell)
(org-babel-do-load-languages 'org-babel-load-languages
			     (append org-babel-load-languages
				     '((plantuml . t)
				       (shell . t)
				       (dot . t))))

(provide 'init-babel)
