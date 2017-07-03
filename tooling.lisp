
;;; (load "/home/rett/.sbclrc")

(ql:quickload :hemlock.clx)


;; Start Slave Process

;; (trace hi::create-slave
;;        :print (progn (format t "arg1: ~s~%" (sb-debug:arg 0))
;; 		     (finish-output)))

;; networking calls
;; connect-to-remote-server
;; connect-to-editor
;; %start-slave
;; start-slave
;; create-request-server

;; macros:
;; xlib:event-case
;; xlib:image-x-hot
;; xlib:image-y-hot
;; xlib:with-gcontext
;; xlib:with-state


(defparameter used-xlibrary-functions
  '(xlib::closed-display-display
    xlib::display-input-stream
    xlib::open-default-display
    xlib:alloc-color
    xlib:bell
    xlib:clear-area
    xlib:close-display
    xlib:closed-display
    xlib:copy-area
    xlib:create-cursor
    xlib:create-gcontext
    xlib:create-pixmap
    xlib:create-window
    xlib:cut-buffer
    xlib:default-keysym-index
    xlib:destroy-window
    xlib:discard-current-event
    xlib:display-default-screen
    xlib:display-finish-output
    xlib:display-force-output
    xlib:draw-glyphs
    xlib:draw-image-glyphs
    xlib:draw-rectangle
    xlib:drawable-height
    xlib:drawable-width
    xlib:drawable-x
    xlib:drawable-y
    xlib:font-ascent
    xlib:font-descent
    xlib:free-cursor
    xlib:free-gcontext
    xlib:free-pixmap
    xlib:gcontext-background
    xlib:gcontext-font
    xlib:gcontext-foreground
    xlib:keycode->keysym
    xlib:make-color
    xlib:make-state-mask
    xlib:map-window
    xlib:max-char-width
    xlib:name-error
    xlib:open-display
    xlib:open-font
    xlib:process-event
    xlib:put-image
    xlib:read-bitmap-file
    xlib:screen-black-pixel
    xlib:screen-root
    xlib:screen-root-depth
    xlib:screen-root-visual-info
    xlib:screen-white-pixel
    xlib:set-standard-properties
    xlib:set-wm-properties
    xlib:translate-coordinates
    xlib:unmap-window
    xlib:visual-info-blue-mask
    xlib:visual-info-green-mask
    xlib:visual-info-red-mask
    xlib:window-background
    xlib:window-border
    xlib:window-colormap
    xlib:window-cursor
    xlib:window-display
    xlib:window-event-mask
    xlib:window-map-state
    xlib:window-plist
    xlib:window-priority
    xlib:wm-normal-hints
    xlib:wm-size-hints-height-inc
    xlib:wm-size-hints-min-height
    xlib:wm-size-hints-min-width
    xlib:wm-size-hints-width-inc
    xlib:wm-size-hints-x
    xlib:wm-size-hints-y))



(defparameter *trace-interaction* '())

(defparameter *iolib-entry-points*
  '(hemlock::create-slave-in-thread
    hemlock::create-slave
    make-process-connection))

(defparameter *enabled-iolib-entry-points*
  '(hi::initialize-instance))

;; (hi::class-for hi::*connection-backend* 'process-connection-mixin)
;; (defun setup-tracing-single ()
;;   (eval `(trace
;; 		:condition (progn
;; 			     (push (sb-debug:arg 0) *xlib-interaction*)
;; 			     nil))))

(defun setup-tracing (functions-to-trace)
  (dolist (function-to-trace functions-to-trace)

    (eval `(trace ,function-to-trace
		  :condition (progn
			       (format t "function-to-trace: ~s~%" '(,function-to-trace))
			       (push (sb-debug:arg 0) *trace-interaction*)
			       nil)))))


;; (setup-tracing *enabled-iolib-entry-points*)

(hemlock:hemlock)
