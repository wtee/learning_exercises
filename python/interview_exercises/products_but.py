"""Given a list of integers, return a new array where each element is
the product of every number in the original list except the number in
the same position in the original list."""
from math import prod


def products_but(numbers):
    return [
        prod(numbers[:i] + numbers[i + 1:]) 
        for i, _ 
        in enumerate(numbers)
    ]


def test_123():
    products_but([1, 2, 3]) == [6, 3, 2]
    

def test_bigger_numbers():
    products_but([8, 16, 32]) ==  [512, 256, 128]
