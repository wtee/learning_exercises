"""
First find the smallest element in the array and exchange it with the element 
in the first position, then find the second smallest element and exchange it 
with the element in the second position, and continue in this way until the 
entire array is sorted. 

Source: https://rosettacode.org/wiki/Sorting_algorithms/Selection_sort
"""

# This function was written using the Python code found here:
# https://rosettacode.org/wiki/Sorting_algorithms/Selection_sort#Python
# and here: https://www.geeksforgeeks.org/selection-sort/ for reference.
def selection_sort(lst):
    llen = len(lst)
    for x, y in enumerate(lst):
        mindex = x
        for i in range(mindex +1, llen):
            if lst[mindex] > lst[i]:
                mindex = i
        
        lst[x], lst[mindex] = lst[mindex], y
    
    return lst
    
# This function was written using the Racket code found here:
# https://rosettacode.org/wiki/Sorting_algorithms/Selection_sort#Racket
# as reference.
def recursive_selection_sort(lst):
    if lst == []:
        return lst
    else:
        min_ = min(lst)
        lst.remove(min_)
        return [min_] + recursive_selection_sort(lst)
        
# A helper function for no_fanciness_selection_sort
def find_index_of_smallest(lst):
    idx = 0
    for x in range(0, len(lst)):
        if lst[x] < lst[idx]:
            idx = x
            
    return idx

# Written with a minimum of frills.
def no_fanciness_selection_sort(lst):
    marker = 0
    for x in lst:
        small_index = marker + find_index_of_smallest(lst[marker:])
        lst[marker], lst[small_index] = lst[small_index], lst[marker]
        marker += 1
        
    return lst