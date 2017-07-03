;;; MOP class that turns on and off logging and that alows replaying of client server input.



(defclass xomax-socket ()
  )


peoples choice we got rythm


;; MOP

;; There are two aspect of our progromatic MOP.  One is to designate
;; certain methods as logable, and the second is to create a central,
;; persistant, log repository associated with the class that allows
;; replaying.


;; Next step in design is to review each of the MOP suprotocol and
;; describe in words what we require.

;; MOP Initialization Protocol

;; The xomax-socket class is a an extention of the standard class.  In
;; addition to the normal parameters, it also takes additional configurations


(setparameter class (make-instance 'standard-class
		      :name 'xomax-socket
		      :direct-superclasses (mapcar #'find-class ingredients)
		      :direct-slots '((:name host-name)
				      (:name port)
				      (:name type))
		      :logging-file "logging.clon"
		      :load-logs-p t))




(setf (find-class name) class)
name
))


(make-instance 'standard-class
	       :name '(xomax-socket)



;; development (MOP) classes ideally you could shut these off if not
;; supported.
(defmethod event-logging-enabled-p ())
(defmethod replay-events ( &key confim-replay))
(defmethod display-event-logs ())
(defmethod load-event-logs ())
(defmethod save-event-logs ())


;; standard socket library
(defmethod socket-bind  ())
(defmethod socket-accept ())
(defmethod socket-connect ())
(defmethod socket-peername ())
(defmethod socket-name ())
(defmethod socket-receive ())
(defmethod socket-send ())
(defmethod socket-listen ())
(defmethod socket-open-p ())
(defmethod socket-close ())
(defmethod socket-shutdown ())
(defmethod socket-make-stream ())
(defmethod socket-make-stream ())
(defmethod socket-error ())
(defmethod non-blocking-mode ())

;; sb-bsd-sockets
