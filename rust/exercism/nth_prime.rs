use std::convert::TryInto;

pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2];
    let mut c: u32 = 3;

    while primes.len() <= n.try_into().unwrap() {
        let mut is_prime = true;
        for p in &primes {
            if c % p == 0 {
                is_prime = false;
                break;
            }
        }

        if is_prime {
            primes.push(c);
        }
        c += 2;
    }
    *primes.last().unwrap()
}
