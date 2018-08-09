;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
;;
;; What is the 10 001st prime number?

(defn prime? [x] (case x
                       1 false
                       2 true
                       (every?
                        #(not (= (rem x %) 0))
                        (range 2 (inc (Math/floor (Math/sqrt x)))))))


(defn solve [] (->> (iterate #(+ % 2) 3)
                    (filter prime?)
                    (take (dec 10001))
                    (last)))

(prn (solve))