(in-package #:nippo-manager)
(defun main ()
  (modest-config:with-config "config"
	  (target-dir is-conv-markdown nippo-url post-url post-password
				  wikihub-token wikihub-user-name)))

(defun rep-dc (str)
  (cl-ppcre:regex-replace-all
   "\"" str ""))

(defun post-nippo (target-pathname url token username)
  (print (list (cons "Authorization" (format nil "Bearer ~A"
														 (rep-dc token)))))
  (print (dex:post url
			:headers (list (cons "Authorization" (format nil "Bearer ~A"
														 token)))
			:content (list (cons "title" (format nil "~A ~A"
												 (rep-dc username)
												 (pathname-name target-pathname)))
						   (cons "body"  (format nil "~{~A~%~}"
												 (mylib:read-file-to-list
												  (namestring target-pathname))))
						   ;; とりあえず空で。
						   (cons "tags_string" "")))))
