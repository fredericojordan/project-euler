;;  Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
;;
;;      37 36 35 34 33 32 31
;;      38 17 16 15 14 13 30
;;      39 18  5  4  3 12 29
;;      40 19  6  1  2 11 28
;;      41 20  7  8  9 10 27
;;      42 21 22 23 24 25 26
;;      43 44 45 46 47 48 49
;;
;;  It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is
;;  that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
;;
;;  If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed.
;;  If this process is continued, what is the side length of the square spiral for which the ratio of primes along both
;;  diagonals first falls below 10%?

(defn prime? [x]
  (case x
    1 false
    2 true
    (every?
      #(not (= (rem x %) 0))
      (range 2 (inc (Math/floor (Math/sqrt x)))))))

(defn spiral-corners [side]
  (cond
    (= side 1) '(1)
    :else (map #(- (* side side) (* % (dec side)))
               (range 0 4))))

(defn prime-corners-count [side]
  (->> (spiral-corners side)
       (filter prime?)
       (count)))

(defn diag-count [side-len] (dec (* 2 side-len)))

(defn more-than-10% [[side-len prime-sum]]
  (let [percentage (/ prime-sum (diag-count side-len))]
    (> percentage 0.1)))

(defn solve []
  (->> (iterate #(+ % 2) 1)
       (map prime-corners-count)
       (reductions +)
       (map-indexed (fn [idx itm] [(inc (* 2 idx)) itm]))
       (drop 1)  ; drop case when side-length = 1
       (drop-while more-than-10%)
       (take 1)
       (first)
       (first)))

(prn (solve))
