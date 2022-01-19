import string


def break_caesar_cipher(text):
    alphabet = string.ascii_lowercase
    text = text.lower()
    shifted_texts = []
    text_idc = [alphabet.index(c) for c in text if c != " "]
    for n in range(26):
        shifted = [
            alphabet[i + n if i + n <= 25 else i + n - 26]
            for i
            in text_idc
        ]
        shifted_texts.append("".join(shifted))
        
    return shifted_texts

