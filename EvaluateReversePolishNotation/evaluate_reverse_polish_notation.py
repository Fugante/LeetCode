def eval_RPN(tokens: list[str]) -> int:
    operators = {
        "+": int.__add__,
        "-": int.__sub__,
        "*": int.__mul__,
        "/": lambda a, b: int(a / b)
    }
    stack = []
    for t in tokens:
        if t in operators:
            i0 = stack.pop()
            i1 = stack.pop()
            stack.append(operators[t](i1, i0))
        else:
            stack.append(int(t))
    return stack.pop()
