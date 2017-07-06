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



;; questions: sbd compatibiliety
;; keepalive value
;; debug option
;; 


;; (setf (find-class name) class)
;; name
;; ))


;; (make-instance 'standard-class
;; 	       :name '(xomax-socket)



(defparameter *localhost-address* '(127 0 0 1))

defun make-listen-socket ()
  (let ((socket (make-instance 'sb-bsd-sockets:inet-socket
			       :type :stream :protocol :tcp)))
    (setf (sb-bsd-sockets:sockopt-reuse-address socket) t)
    (sb-bsd-sockets:socket-bind socket *localhost-address* 8080)
    (sb-bsd-sockets:socket-listen socket 1)
    socket))




(defparameter *socket*
  (make-instance 'sb-bsd-sockets:inet-socket :type :stream :protocol :tcp))

(sb-bsd-sockets:socket-bind *socket* (sb-bsd-sockets:make-inet-address "1.0.0.127") 8081)


(defun configure-socket ()
    (let ((socket (make-instance 'sb-bsd-sockets:inet-socket :type :stream :protocol :tcp)))
))
      (sb-sockets:bind *socket* "1.0.0.127" 8081)

	       
(sb-bsd-sockets:socket :protocol 
 

;; development (MOP) classes ideally you could shut these off if not
;; supported.
(defmethod event-logging-enabled-p ())
(defmethod replay-events ( &key confim-replay))
(defmethod display-event-logs ())
(defmethod load-event-logs ())
(defmethod save-event-logs ())


;; standard socket library
(defmethod non-blocking-mode ())
(defmethod socket-accept ())
(defmethod socket-bind  ())
(defmethod socket-close ())
(defmethod socket-connect ())
(defmethod socket-error ())
(defmethod socket-listen ())
(defmethod socket-make-stream ())
(defmethod socket-name ())
(defmethod socket-open-p ())
(defmethod socket-peername ())
(defmethod socket-receive ())
(defmethod socket-send ())
(defmethod socket-shutdown ())

;; sb-bsd-sockets
