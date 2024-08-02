(: BinaryTree type)
(: Nil BinaryTree)
(: Node (-> $T BinaryTree BinaryTree BinaryTree))

======================================================= 
 ;head, left,right nodes
(= (head-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ( (Node $x $left $right) $x)))
    )
)
(= (left-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ( (Node $x $left $right) $left)))
    )
)
(= (right-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ( (Node $x $left $right) $right)))
    )
)
======================================================== 
 ;insert node
(= (insert $value $tree)
    (if (== $tree Nil)
        (Node $value Nil Nil)
        (if (< $value (head-tree $tree))
            (Node (head-tree $tree) (insert $value (left-tree $tree)) (right-tree $tree))
            (Node (head-tree $tree) (left-tree $tree) (insert $value (right-tree $tree)))
        )
)
)

! (insert 2 (Node 1 (Node 2 Nil Nil) (Node 3 Nil Nil))) ;-> (Node 1 (Node 2 Nil Nil) (Node 3 (Node 2 Nil Nil) Nil))

========================================================= 
 ;search node
(= (search $value $tree)
    (if (== $tree Nil)
        False
        (if (== $value (head-tree $tree))
            True
            (or (search $value (left-tree $tree)) (search $value (right-tree $tree)))
        )
)
)
! (search 2 (Node 1 (Node 2 Nil Nil) (Node 3 Nil Nil))) ;-> True