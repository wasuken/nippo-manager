;; (in-package :cl-user)
(defpackage nippo-manager
  (:use :cl)
  (:shadowing-import-from :dexador :get)
  (:export :post-nippo :rep-dc))
