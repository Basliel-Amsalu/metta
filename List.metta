(: List type)
(: Nil List)
(: Cons (-> Number List List))

! (get-type (Cons 1 Nil)) ; List
! (Cons 1 (Cons 2 (Cons 3 Nil))) ; [1,2,3]

(= (head Nil) Nil)
(= (head (Cons $x $xs)) $x)

(= (tail Nil) Nil)
(= (tail (Cons $x $xs)) $xs)
