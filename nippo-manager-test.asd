;; (require \'asdf)
 
 (in-package :cl-user)
 (defpackage nippo-manager-test-asd
 (:use :cl :asdf))
 (in-package :nippo-manager-test-asd)
 
 (defsystem nippo-manager-test
 :depends-on (:nippo-manager)
 :version "1.0.0"
 :author "wasu"
 :license "MIT"
 :components ((:module "t" :components ((:file "nippo-manager-test"))))
 :perform (test-op :after (op c)
 (funcall (intern #.(string :run) :prove) c)))

