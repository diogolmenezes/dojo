(ns fizz-buzz.core-test
  (:require [clojure.test :refer :all]
            [fizz-buzz.core :refer :all]))

(deftest fizz-buzz-test
  (testing "When input 1 write 1"
    (is (= 1 (fizz-buzz 1))))

  (testing "When input 2 write 2"
    (is (= 2 (fizz-buzz 2))))

  (testing "When input 3 write Fizz"
    (is (= "Fizz" (fizz-buzz 3))))

  (testing "When input 4 write 4"
    (is (= 4 (fizz-buzz 4))))

  (testing "When input 5 write Buzz"
    (is (= "Buzz" (fizz-buzz 5))))

  (testing "When input 6 write Fizz"
    (is (= "Fizz" (fizz-buzz 6))))

  (testing "When input 9 write Fizz"
    (is (= "Fizz" (fizz-buzz 9))))

  (testing "When input 10 write Buzz"
    (is (= "Buzz" (fizz-buzz 10))))

  (testing "When input 15 write Fizz-Buzz"
    (is (= "Fizz-Buzz" (fizz-buzz 15))))

  (testing "When input 30 write Fizz-Buzz"
    (is (= "Fizz-Buzz" (fizz-buzz 30))))

  (testing "When input 45 write Fizz-Buzz"
    (is (= "Fizz-Buzz" (fizz-buzz 45))))

  (testing "When input 46 write Fizz-Buzz"
    (is (= 46 (fizz-buzz 46))))
)
