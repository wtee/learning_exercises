"""
Find a pair of numbers in an array that add up to a given number.
A workthrough/translation of the algorithms presented here:
http://www.techiedelight.com/find-pair-with-given-sum-array/
"""

def find_sum_naive(arr, sum_):
    end = len(arr)
    for i in range(0,end):
        for n in range(0, end):
            if i + n == sum_:
                return "arr[{}]: {} + arr[{}]: {} = {}".format(arr[i], i, arr[n], n, sum_)

    return "Pair not found."

def find_sum_sorted(arr, sum_):
    arr.sort()
    end = len(arr) - 1
    begin = 0

    while begin < end:
        if arr[begin] + arr[end] == sum_:
            return [(arr[begin], arr[end])] # "arr[{}]: {} + arr[{}]: {} = {}".format(begin, arr[begin], end, arr[end], sum_)
        else:
            if arr[begin] + arr[end] < sum_:
                begin += 1
            else:
                end -= 1

    return "Pair not found."

def find_sum_iter(arr, sum_):
    return [x
             for x
             in itertools.combinations(arr, 2)
             if x == 10]

def find_sum_dict(arr, sum_):
    end = len(arr) + 1
    for x in range(0,end):



sum1 = 10
sum2 = 100
sum3 = 2

print('Naive algorithm:')
print(find_sum_naive(test_arr, sum1))
print(find_sum_naive(test_arr, sum2))
print(find_sum_naive(test_arr, sum3))

print('Sorted algorithm:')
print(find_sum_sorted(test_arr, sum1))
print(find_sum_sorted(test_arr, sum2))
print(find_sum_sorted(test_arr, sum3))
