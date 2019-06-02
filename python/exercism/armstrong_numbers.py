def is_armstrong(number):
    number_list = [int(n) for n in str(number)]
    armstrong_power = len(number_list)
    armstrong_sum = 0
    
    for n in number_list:
        armstrong_sum += n ** armstrong_power

    if armstrong_sum == number:
        return True

    return False


    
    
