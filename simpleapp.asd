(in-package :cl-user)

(defpackage :simpleapp-asd
  (:use :cl :asdf))
(in-package :simpleapp-asd)

(ql:quickload :cffi)

(progn
  (handler-bind ((cffi:load-foreign-library-error
                   #'(lambda (c)
                       (declare (ignore c))
                       (use-value "libmysqlclient.so"))))
    (ql:quickload :cl-mysql)))

(defsystem simpleapp
  :depends-on (:clack :mito)
  :components ((:module "src"
                :components
                ((:file "impl"))))
  )
