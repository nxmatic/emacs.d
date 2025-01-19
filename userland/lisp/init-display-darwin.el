(straight-use-package 'osx-clipboard)

(osx-clipboard-mode +1)


(progn
   (trace-function-background 'osx-clipboard-mode)
   (trace-function-background 'osx-clipboard-cut-function)
   (trace-function-background 'osx-clipboard-paste-function))
  
(if nil
    (progn (untrace-function 'osx-clipboard-mode)
 	   (untrace-function 'osx-clipboard-cut-function)
 	   (untrace-function 'osx-clipboard-paste-function))
  )

(provide 'init-display-darwin)
