def is_valid(s: str) -> bool:
    symbols = {")": "(", "]": "[", "}": "{"}
    stack = []
    for t in s:
        if t in symbols.values():
            stack.append(t)
            continue
        if not stack:
            return False
        if stack.pop() != symbols[t]:
            return False
    return not stack

