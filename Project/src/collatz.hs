-- The Collatz Conjecture or 3x+1 problem can be summarized as follows:

-- Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach 1 eventually.

-- Given a number n, return the number of steps required to reach 1.


collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
          | n == 1 = Just 0
          | even n     = succ <$> collatz (n `div` 2)
          | otherwise  = succ <$> collatz (3 * n + 1)

collatz2 :: Integer -> Integer
collatz2 n
    | n == 1 = 0
    | even n = collatz2 (n `div` 2)
    | odd n = collatz2 (n * 3 + 1)

descend :: (Num i, Ord i) => i -> i -> [i]
descend n a
    | n <= 0    = [a]
descend _ a
    | a <= 0    = []
descend n a= a:descend (n-1) (a-1)