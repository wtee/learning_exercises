def distance(strand_a, strand_b):
    if len(strand_a) == len(strand_b):
        return len([n for n in zip(strand_a, strand_b) if n[0] != n[1]])
    else:
        raise ValueError("strand_a, strand_b not same length")
