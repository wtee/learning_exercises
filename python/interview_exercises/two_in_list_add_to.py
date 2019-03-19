"""A program to complete the following exercise: Given a list of numbers
and a number n, return whether any two numbers from the list add up to n."""

import unittest


def two_in_list_add_to(num_list, num):
    """Tests if two numbers in a list add up to a given number.

    Return True if two integers in num_list add up to num,
    otherwise, return False.

    Parameters
    ----------
    num_list : list of int
        A list of numbers.
    num : int
        numeric a number

    Returns
    -------
    bool
    """
    for idx, n in enumerate(num_list):
        to_find = num - n
        if to_find in num_list[:idx] + num_list[idx + 1 :]:
            return True

    return False


def two_in_list_add_to_recursive(num_list, num):
    """Tests if two numbers in a list add up to a given number.

    Return True if two integers in num_list add up to num,
    otherwise, return False.

    Parameters
    ----------
    num_list : list of int
        A list of numbers.
    num : int
        numeric a number

    Returns
    -------
    bool
    """
    if not num_list:
        return False

    to_find = num - num_list[0]
    if to_find in num_list[1:]:
        return True

    return two_in_list_add_to_recursive(num_list[1:], num)


class TestClass(unittest.TestCase):
    """Tests for two_in_list_add_to and two_in_list_add_to_recursive."""

    def test_positive(self):
        """Test if two_in_list_add_to works with positive numbers."""
        test_list = [1, 1, 2, 3, 5, 8]
        self.assertTrue(two_in_list_add_to(test_list, 13))
        self.assertTrue(two_in_list_add_to_recursive(test_list, 13))

    def test_negative(self):
        """Test if two_in_list_add_to works with negative numbers."""
        test_list = [1, 2, -3, 5, -10, 50]
        self.assertTrue(two_in_list_add_to(test_list, -13))
        self.assertTrue(two_in_list_add_to_recursive(test_list, -13))

    def test_dont_count_current_num(self):
        """Test that two_in_list_add_to doesn't add a number from
        the list to itself."""
        test_list = [1, 3, 4, 5]
        self.assertFalse(two_in_list_add_to(test_list, 2))
        self.assertFalse(two_in_list_add_to_recursive(test_list, 2))
