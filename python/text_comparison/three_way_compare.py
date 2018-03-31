from difflib import SequenceMatcher
from jinja2 import Template

def load_text(file_name):
    with open(file_name, 'r') as fh:
        text = fh.read()
    
    return text


def three_way_compare(seq1, seq2, seq3):
    one_to_two   = SequenceMatcher(None, seq1, seq2)
    one_to_three = SequenceMatcher(None, seq1, seq3)
    two_to_three = SequenceMatcher(None, seq2, seq3)

    one_two_diff   = [x for x in one_to_two.get_opcodes() if x[0] != 'equal']
    one_three_diff = [x for x in one_to_three.get_opcodes() if x[0] != 'equal']
    two_one_diff   = [(x[0], x[3], x[4]) for x in one_two_diff]
    two_three_diff = [x for x in two_to_three.get_opcodes() if x[0] != 'equal']
    three_one_diff = [(x[0], x[3], x[4]) for x in one_three_diff]
    three_two_diff = [(x[0], x[3], x[4]) for x in two_three_diff]

    td1 = compare_two_to_one(seq1, one_two_diff, one_three_diff, 'from2', 'from3')
    td2 = compare_two_to_one(seq2, two_one_diff, two_three_diff, 'from1', 'from3')
    td3 = compare_two_to_one(seq3, three_two_diff, three_one_diff, 'from1', 'from2')

    return (td1, td2, td3)


def compare_two_to_one(seq, diff1, diff2, class1, class2):
    out_seq = ''
    d1_idx = 0
    d2_idx = 0
    d1_len = len(diff1) - 1
    d2_len = len(diff2) - 1

    for i, c in enumerate(seq):
        #print(diff1[d1_idx])
        #print(diff2[d2_idx][1])
        if i == diff1[d1_idx][1] and i == diff2[d2_idx][1]:
            out_seq += f'<span class="{diff1[d1_idx][0]} {class1}"><span class="{diff2[d2_idx][0]} {class2}">'
        elif i == diff1[d1_idx][1]:
            out_seq += f'<span class="{diff1[d1_idx][0]} {class1}">'
        elif i == diff2[d2_idx][1]:
            out_seq += f'<span class="{diff2[d2_idx][0]} {class2}">'
        
        if i == diff1[d1_idx][2] and i == diff2[d2_idx][2]:
            out_seq += '</span></span>'
            if d1_idx < d1_len:
                d1_idx += 1
            if d2_idx < d2_len:
                d2_idx += 1
        elif i == diff1[d1_idx][2]:
            out_seq += '</span>'
            if d1_idx < d1_len:
                d1_idx += 1
        elif i == diff2[d2_idx][2]:
            out_seq += '</span>'
            if d2_idx < d2_len:
                d2_idx += 1

        out_seq += c

    return out_seq


def render_output(diffs):
    output_file = 'three_diffs.html'
    template = Template("""
    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Three-way comparison</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css" />
            <link rel="stylesheet" href="diff.css" />
            <title>Three-way comparison</title>
        </head>
        <body>
            <main>
                <header>
                    <h1>Three-way comparison</h2>
                </header>
                <table>
                    <tbody>
                        <tr>
                            {% for d in diffs %}
                                <td>{{ d }}</td>
                            {% endfor %}
                        </tr>
                    </tbody>
                </table>
                <br />
                <br />
                <footer>
                    <table>
                        <thead>
                            <tr><th>Key</th></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="insert">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Insertion</td>
                            </tr>
                            <tr>
                                <td class="replace">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Alteration</td>
                            </tr>
                            <tr>
                                <td class="delete">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Deletion</td>
                            </tr>
                            <tr>
                                <td class="from1">Underlined text</td><td>Differs from 1st document</td>
                            </tr>
                            <tr>
                                <td class="from2">Bold text</td><td>Differs from 2nd document</td>
                            </tr>
                            <tr>
                                <td class="from3">Italicized text</td><td>Differs from 3rd document</td>
                            </tr>
                        </tbody>
                    </table>
                </footer>
            </main>
        </body>
    </html>
    """)

    with open(output_file, 'w') as fh:
        fh.write(template.render(diffs=diffs))


def make_comparison(seq1, seq2, seq3):
    render_output(three_way_compare(seq1, seq2, seq3))