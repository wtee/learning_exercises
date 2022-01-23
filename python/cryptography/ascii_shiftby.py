def ascii_shift(text, shift, chunk):
    """A simple substitution cipher that can be used to encrypt and
    decrypt ASCII strings. Very insecure."""
    shifted = [
        chr(shift ^ ord(c.lower()))
        for c
        in text
        if c != " "
    ]
    
    return " ".join(
        "".join(i for i in c)
        for c
        in [
            shifted[i:i + chunk]
            for i
            in range(0, len(shifted), chunk)
        ]
    )
