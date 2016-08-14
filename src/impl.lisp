(in-package :cl-user)
(defpackage :simpleapp.impl
  (:use :cl)
  (:export :init :serve))

(in-package :simpleapp.impl)

(defun init ()
  (mito:connect-toplevel :mysql :host "mysql" :username "root" :password "simple"))

(defun check ()
  (when (mito:retrieve-by-sql "select 1+1")
    t))

(defun app (env)
  (declare (ignore env))
  (if (check)
      '(200 (:content-type "text/plain") ("OK"))
      '(400 (:content-type "text/plain") ("NG"))))

(defun serve ()
  (clack:clackup #'app
                 :server :woo
                 :debug nil
                 ))
