(defn rand-int
  ``Generate a random integer i, either in 0 <= i < n,
  or --- if `m` is given --- in n <= i < m.``
  [n &opt m]
  (when m (assert (> m n)))
  (var start 0)
  (var end   0)
  (if m
    (do
      (set start n)
      (set end   m))
    (do
      (set start 0)
      (set end   n)))
  (+ start
     (math/trunc (* (math/random)
                    (- end start)))))

(defn rand-elem
  ``Choose a random element from array `arr`.``
  [arr]
  (get arr
       (rand-int (length arr))))

(defn rand-elems
  ``Randomly choose `n` elements from array `arr`. Any
  given element of `arr` may only be chosen once.``
  [n arr]
  (assert (<= n (length arr)))
  (def res @[])
  (def ar2 (array ;arr))
  (for _ 0 n
    (let [i (rand-int (length ar2))]
      (array/push res (ar2 i))
      (array/remove ar2 i)))
  res)

(defn rand-rolls
  ``Like the rolls of a die, choose `n` values randomly
  from the elements in the array `arr`. A given value may
  be selected more than once.``
  [n arr]
  (var res @[])
  (for _ 0 n
    (array/push res
                (rand-elem arr)))
  res)

(defn shuffle
  ``Return a shuffled copy of `arr`.``
  [arr]
  (rand-elems (length arr) arr))

(defn rand-key
  ``Get a random key from table `t`.``
  [t]
  (rand-elem (keys t)))

(defn rand-val
  ``Get a random value from table `t`.``
  [t]
  (rand-elem (values t)))

(defn rand-kv
  ``Get a random key/value pair (as a tuple) from
  table `t`.``
  [t]
  (rand-elem (pairs t)))

(defn rand-str
  ``Generate a random lowercase ascii string,
  `n` characters long.``
  [n]
  (def ltrs (map string/from-bytes
                 "abcdefghijklmnopqrstuvwxyz"))
  (string/join (rand-rolls n ltrs)))
