def fizzbuzz(num):
    if num % 3 == 0 and num % 5 == 0:
        output = 'fizzbuzz'
    elif num % 3 == 0:
        output = 'fizz'
    elif num % 5 == 0:
        output = 'buzz'
    else:
        output = num

    return output

[print(fizzbuzz(i)) for i in range(1,101)]
