import unittest

def fizzbuzz(number):
    result = ""
    for i in range(1,number+1):
        if i % 3== 0 and i % 5 == 0: 
            result += "FIZZBUZZ"
        elif i % 3 == 0:
            result += "FIZZ"
        elif i % 5 == 0:
            result += "BUZZ"

        else:
            result += str(i)
        result += " "
    return result.strip()
    

class TestFizzBuzz(unittest.TestCase):
    """
    FizzBuzz tests
    """

    def test_prints_1_for_1(self):
        """
        If you pass 1, FizzBuzz prints 1
        """
        self.assertEqual("1", fizzbuzz(1))

    def test_prints_1_2_for_2(self):
        """
        If you pass 2, FizzBuzz prints 1 and 2
        """
        self.assertEqual("1 2", fizzbuzz(2))

    def test_prints_fizz_for_multiples_of_3(self):
        """
        If you pass in 3, FizzBuzz prints 1 2 FIZZ
        """
        self.assertEqual("1 2 FIZZ", fizzbuzz(3))

    def test_prints_buzz_for_multiples_of_5(self):
        """
        If you pass in 5, FizzBuzz prints 1 2 FIZZ 4 BUZZ
        """
        self.assertEqual("1 2 FIZZ 4 BUZZ", fizzbuzz(5))

    def test_prints_fizzbuzz_for_multiples_of_3_and_5(self):
        """
        If you pass in 15, FizzBuzz prints FIZZBUZZ for 15
        """
        self.assertEqual(
            "1 2 FIZZ 4 BUZZ FIZZ 7 8 FIZZ BUZZ 11 FIZZ 13 14 FIZZBUZZ", 
            fizzbuzz(15))

    @classmethod
    def tearDownClass(cls):
        print("\n\nAnd finally...")
        print(fizzbuzz(100))

if __name__ == '__main__':
    unittest.main()
