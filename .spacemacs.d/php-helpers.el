(defun php-current-full-qualified-class ()
  (interactive)
  (let* ((matched-class (php-get-current-element php--re-classlike-pattern))
         (matched-namespace (php-get-current-element php--re-namespace-pattern))
         (qualified-name (concat matched-namespace "\\" matched-class)))
    (message qualified-name)
    (kill-new qualified-name)))
