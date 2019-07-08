from textwrap import wrap

def proteins(strand):
    stops = set(("UAA", "UAG", "UGA"))
    translation = {
        "AUG": "Methionine",
        "UUU": "Phenylalanine",
        "UUC": "Phenylalanine",
        "UUA": "Leucine",
        "UUG": "Leucine",
        "UCU": "Serine",
        "UCC": "Serine",
        "UCA": "Serine",
        "UCG": "Serine",
        "UAU": "Tyrosine",
        "UAC": "Tyrosine",
        "UGU": "Cysteine",
        "UGC": "Cysteine",
        "UGG": "Tryptophan",
    }

    names = []
    for p in wrap(strand, 3):
        if p in stops:
            break
        
        try:
            names.append(translation[p])
        except KeyError:
            print(f"Unknown protein {p}")

    return names
