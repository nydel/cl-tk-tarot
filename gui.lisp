(ql:quickload '(:bordeaux-threads
		:ltk))

(use-package :ltk)

(defun &summon-window ()
  (with-ltk ()
    (let* ((frame (make-instance 'frame))
	  (b1 (make-instance 'button
			     :master frame
			     :text "button first"
			     :command (lambda () (format t "button 1..~&"))))
	  (b2 (make-instance 'button
			     :master frame
			     :text "button second"
			     :command (lambda () (format t "button 2..~&"))))
	  (mylabel (make-instance 'label :text "cl-tarot tarot-card interface")))
      (pack frame)
      (pack b1 :side :left)
      (pack b2 :side :left)
      (configure frame :borderwidth 3)
      (configure frame :relief :sunken))))

(defun &summon-a-card ()
  (with-ltk ()
    (let* ((spread
	    (assoc-draw))
	   (card
	    (car spread))
	   (card-path
	    (fifth card))
	   (card-item-photo
	    (make-instance 'photo-image :file #P"/home/jo/2014/cl-tarot/images/cups01.png"))
	   (card-item
	    (make-instance 'label :text "hello there!"
			   :image card-item-photo)))
    (grid card-item 0 0))))

(defun summon-window ()
  (bt:make-thread
   (lambda ()
     (&summon-window)
     :name "cl-tarot tcl/tk threaded window 0010")))
