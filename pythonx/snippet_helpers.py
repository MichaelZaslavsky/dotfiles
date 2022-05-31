"""
Python function helpers used by the snippets
"""


def complete(text, opts):
    "Completes a text from the specified options"
    if text:
        opts = [m[len(text):] for m in opts if m.startswith(text)]
    if len(opts) == 1:
        return opts[0]
    return "(" + '|'.join(opts) + ')'
