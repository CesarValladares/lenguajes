
(define (sum_list data)
    (if (list? data)
        (+ (car data) (cdr (sum_list data))) 
        (data)
    )
)