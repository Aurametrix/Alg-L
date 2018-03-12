(case '("x" (foo 2 3))
    [(string?  @ ?x) (.. "Got a string " x)]
    [("x" (foo . ?x)) (.. "Got some remaining values " (pretty x))])
;;  out = "Got some remaining values (2 3)"

(loop [(o '())
   (l '(1 2 3))]
   [(empty? l) o]
   (recur (cons (car l) o) (cdr l)))
;; out = (3 2 1)
