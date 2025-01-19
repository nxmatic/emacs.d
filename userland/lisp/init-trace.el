(defun display-trace-in-minibuffer (buffer _action)
  "Display the trace output in the minibuffer."
  (when (string= (buffer-name buffer) "*trace-output*")
    (let ((trace-output (with-current-buffer buffer (buffer-string))))
      (message "%s" trace-output))))

(add-function :after trace-function
              (lambda (_fun _name _props _depth _buffer _rest)
                (add-hook 'window-configuration-change-hook #'display-trace-in-minibuffer)))

(provide 'init-trace)
