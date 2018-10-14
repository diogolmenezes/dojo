(ns fizz-buzz.core)

(defn multiple-of? [number target] (= 0 (rem number target)))

(defn multiple-of-3? [number] (multiple-of? number 3))

(defn multiple-of-5? [number] (multiple-of? number 5))

(defn multiple-of-3-and-5? [number] (and (multiple-of-3? number) (multiple-of-5? number)))

(defn fizz-buzz [number] 
  (cond     
    (multiple-of-3-and-5? number) "Fizz-Buzz"
    (multiple-of-3? number) "Fizz"
    (multiple-of-5? number) "Buzz"
    :else  number))

(defn play []   
  (do
    (println "Give me a number:")
    (println (fizz-buzz (Integer/parseInt (read-line))))
    (recur)))

(defn -main [] (play))