;; Inline block name for HTML/ox-hugo export.
;; #+begin_theorem Partial Sum Formula → <div class="theorem" data-name="Partial Sum Formula">
(defun my/org-hugo-special-block-inline-name (orig-fn special-block contents info)
  (let* ((result (funcall orig-fn special-block contents info))
         (params (org-element-property :parameters special-block))
         (type   (downcase (org-element-property :type special-block))))
    (if (and params result
             (string-match (regexp-quote (format "<div class=\"%s\">" type)) result))
        (replace-regexp-in-string
         (regexp-quote (format "<div class=\"%s\">" type))
         (format "<div class=\"%s\" data-name=\"%s\">" type params)
         result nil t)
      result)))

(advice-add 'org-hugo-special-block :around #'my/org-hugo-special-block-inline-name)
