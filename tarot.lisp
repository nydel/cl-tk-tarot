
;(defparameter awol-cards (make-hash-table))


(defun draw (num)
  (let ((awol-cards (make-hash-table))
	(hand (list)))
    (loop
       for n = (random 78)
       unless (gethash n awol-cards) do
	 (setf (gethash n awol-cards) t)
	 (push n hand)
       until (= (length hand) num))
    hand))

	 
