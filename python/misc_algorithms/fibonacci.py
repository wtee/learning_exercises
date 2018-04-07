def fib_gen(x, y):
    while True:
        if x == 0 and y == 0:
            out = 1
        else:
            out = x + y

        x, y = y, out
    
        yield out
        
def fib(n):
    neg = False
    
    if n < 0:
        neg = True
        
    if abs(n) == 1 or n == 0:
        return n
    else:
        fibs = fib_gen(0,1)
        for i in range(1,abs(n)):
            _ = next(fibs)
        
        if neg:
            return -_
        else:
            return _
            
            
fibs = fib_gen(0,0) 

for _ in range(0,11):
    print(next(fibs))
    
print("The fifth Fibonacci number is {}".format(fib(5)))
print("The tenth Fibonacci number is {}".format(fib(10)))

        