(require 'init-straight)

(straight-use-package 'plantuml-mode)

(let ((user-emacs-plantuml-jar-path (locate-user-emacs-file "lib/plantuml.jar")))
  (eval-after-load 'plantuml-mode
    (progn 
      (setq plantuml-jar-path user-emacs-plantuml-jar-path)
      (if (not (file-exists-p user-emacs-plantuml-jar-path))
	  (async-start 'plantuml-download-ja
		       (plantuml-download-jar)))))
    (eval-after-load 'org
      (setq org-plantuml-jar-path plantuml-jar-path)))

(eval-after-load 'babel
  (org-babel-do-load-languages 'org-babel-load-languages
			     (append org-babel-load-languages
				     '((plantuml . t)))))
(provide 'init-plantuml)
