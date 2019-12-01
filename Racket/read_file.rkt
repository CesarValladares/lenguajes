#lang racket

(define (read-numbers file numbers)
    (let 
        ([line (read-line file)]
        [numbers numbers])
        ; Check if the line could be read
        (if (eof-object? line)
            numbers
            (begin
                (cons line numbers)
                (read-numbers (string->number file) numbers)))))

(define (sort-numbers file)
    (read-numbers file '())
)

(call-with-input-file "test.txt"
                       sort-numbers)