#|
30/09/2019
|#



(define (squares data)

    (let loop ([lst data][results empty])
        (if (empty? lst)
            results
            (loop (cdr lst) (append results (list (* (car lst) (car lst)))))
        )
    )

)

; Using map and lambda
(define (squares-map data)
    (map (lambda (x) (* x x)) data)
)

; Using list comprehensions
(define (squares-for data)
    (for ([i data])
        (display (* i i))
    )
)