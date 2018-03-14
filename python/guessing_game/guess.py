#!/usr/bin/python3
"""
A guessing game that uses a recursive binary search to
find a randomly-selected number and a randomly-selected
letter.
"""
import random
import string

num_answer = random.randint(1,100)
alpha_answer = random.choice(string.ascii_lowercase)

def binary_search(haystack, needle):
    index = len(haystack) // 2

    print(f'Guess: {haystack[index]}')

    if haystack[index] == needle:
        return needle
    elif haystack[index] < needle:
        return binary_search(haystack[index + 1:], needle)
    else:
        return binary_search(haystack[:index], needle)


print(f'Seeking: {num_answer}')
binary_search(range(1,101), num_answer)

print(f'Seeking: {alpha_answer}')
binary_search(string.ascii_lowercase, alpha_answer)
