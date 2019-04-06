def is_pangram(sentence):
    return 26 == len(set([c for c in sentence.lower() if c.isalpha()]))
