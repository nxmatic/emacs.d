(let ((emacs-directory
        (file-name-directory (file-truename load-file-name))))
  (setenv "USER_EMACS_DIRECTORY" (concat emacs-directory "userland"))
  (load (expand-file-name "init~radian.el" emacs-directory)))

