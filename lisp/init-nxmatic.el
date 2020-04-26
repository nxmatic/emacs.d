(eval-after-load 'projectile
    '(progn
       (setq projectile-project-search-path '("~/" "~/Coding/nxmatic"))
       (projectile-discover-projects-in-search-path)))

(eval-after-load 'org
       (setq org-plantuml-jar-path (expand-file-name "/usr/local/opt/plantuml/libexec/plantuml.jar")))

(provide 'init-nxmatic)
