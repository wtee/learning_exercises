"""Challenge: Test if any pair of numbers in a list add up to a given number.
A redo of two_in_list_add_to.py"""

from itertools import combinations


def any_two_equal(lst, n):
    return n in [x[0] + x[1] for x in combinations(lst, 2)]


def test_true():
    assert any_two_equal([10, 45, 19, 64], 29) == True


def test_false():
    assert any_two_equal([1, 5, 7, 2], 20) == False