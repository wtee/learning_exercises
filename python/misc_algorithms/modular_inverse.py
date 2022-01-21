def gcd_extended(a, b):
    if a == 0:
        return b, 0, 1
    
    gcd, x, y = gcd_extended(b % a, a)
    
    return gcd, y - (b // a) * x, x


def mod_inverse(a, b):
    _, x, _ = gcd_extended(a, b)
    return (x % b + b) % b