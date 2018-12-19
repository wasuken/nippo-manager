(in-package :cl-user)
(defpackage run-main
  (:use :cl :nippo-manager))
(in-package #:run-main)

(modest-config:with-config "config"
	(target-dir is-conv-markdown nippo-url post-url post-password
				wikihub-token wikihub-user-name)
  (let ((today-nippo-path
		 (first (directory (rep-dc
					 (format nil "~s~s" target-dir
							 (mylib:get-format-date "~D-~2,'0D-~2,'0D.md")))))))
	(cond (today-nippo-path
		   (nippo-manager:post-nippo today-nippo-path (nippo-manager:rep-dc nippo-url)
			(nippo-manager:rep-dc wikihub-token) (nippo-manager:rep-dc wikihub-user-name))))))
