(require 'init-straight)

(straight-use-package 'babel)

(with-eval-after-load 'babel
  (org-babel-do-load-languages 'org-babel-load-languages
			       (append org-babel-load-languages
				       '((shell . t)
					 (dot . t)))))

(provide 'init-babel)
