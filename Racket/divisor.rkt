#|
Find numbers that are visible up to the input
César Valladares
|#

(define (divisible? test limit)

    (if (= limit 1)
        #t
        (if (= 0 (remainder test limit))
            (divisilbe? test (- limit 1))
            #f
        )
    )
)

(define (divisible-up-to limit)

    (let loop 
        (
            [test (* limit (- limit 1))]
            [limit limit]
        )
        (if (divisilbe? test limit)
            test
            (loop (+ test limit) limit)   
        )
    )   
)