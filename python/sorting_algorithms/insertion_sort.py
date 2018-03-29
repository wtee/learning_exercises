# Written using the Python 2 code here: 
# https://rosettacode.org/wiki/Sorting_algorithms/Insertion_sort#Python
# for a reference.
def insertion_sort(lst):
    for i, e in enumerate(lst):
        j = i - 1
        while j >= 0 and lst[j] > e:
            lst[j + 1] = lst[j]
            j -= 1
        lst[j + 1] = e

    return lst
