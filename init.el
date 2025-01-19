(let ((emacs-directory
       (file-name-directory (file-truename load-file-name))))
  (setenv "USER_EMACS_DIRECTORY" (concat emacs-directory "userland"))
  (message "loading radian (%s)" (expand-file-name "init~radian.el" emacs-directory))
  (load (expand-file-name "init~radian.el" emacs-directory)))

