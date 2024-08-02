(: BinaryTree type)
(: Nil BinaryTree)
(: Node (-> $T BinaryTree BinaryTree BinaryTree))

(= (head-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ((Node $x $left $right) $x)))
    )
)
(= (left-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ((Node $x $left $right) $left)))
    )
)
(= (right-tree $tree)
    (if (== $tree Nil)
        Nil
        (case $tree ( ((Node $x $left $right) $right)))
    )
)