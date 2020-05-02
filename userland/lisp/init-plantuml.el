(require 'init-straight)

(straight-use-package 'plantuml-mode)

(with-eval-after-load 'plantuml-mode
  (let ((user-emacs-plantuml-jar-path (locate-user-emacs-file "lib/plantuml.jar")))
    (setq plantuml-jar-path user-emacs-plantuml-jar-path)
    (with-eval-after-load 'ob-plantuml
      (setq org-plantuml-jar-path user-emacs-plantuml-jar-path))
    (unless (file-exists-p user-emacs-plantuml-jar-path)
	(async-start 'plantuml-download-jar
		     (plantuml-download-jar)))))

(with-eval-after-load 'babel
  (org-babel-do-load-languages 'org-babel-load-languages
			     (append org-babel-load-languages
				     '((plantuml . t)))))

(provide 'init-plantuml)
