(defvar w/wrap-region-wrap-map '(("(" . ("(" . ")"))
                                 (")" . ("(" . ")"))
                                 ("()" . ("(" . ")"))
                                 ("[" . ("[" . "]"))
                                 ("]" . ("[" . "]"))
                                 ("[]" . ("[" . "]"))
                                 ("{" . ("{" . "}"))
                                 ("}" . ("{" . "}"))
                                 ("{}" . ("{" . "}"))
                                 ("'" . ("'" . "'"))
                                 ("''" . ("'" . "'"))
                                 ("\"" . ("\"" . "\""))
                                 ("\"\"" . ("\"" . "\""))
                                 ) "Used by ‘w/wrap-region-match-wrap’")

(defun w/wrap-region--find-match-wrap(text)
  "Find match wrap"
  (cdr (car (delq nil (mapcar (lambda (x)
                      (when (string-equal text (car x))
                        x)) w/wrap-region-wrap-map)))))

(defun w/wrap-region(left-text right-text)
  "Wrap by left-text/righ-text"
  (let ((start (region-beginning))
        (end (region-end)))
    (if  (region-active-p)
        (save-excursion
          (goto-char end)
          (insert right-text)
          (goto-char start)
          (insert left-text)
          "")
      "")))

(defun w/wrap-region-wrap (text)
  "Wrap current selection by text"
  (interactive "sWrap: ")
  (w/wrap-region text text))

(defun w/wrap-region-match-wrap (text)
  "Wrap current selection by match text"
  (interactive "sWrap: ")
  (let* ((wrap-text (w/wrap-region--find-match-wrap text))
         (left-text (car wrap-text))
         (right-text (cdr wrap-text)))
    (if wrap-text (w/wrap-region left-text right-text)
      (w/wrap-region text text))))

(provide 'core/feature)
