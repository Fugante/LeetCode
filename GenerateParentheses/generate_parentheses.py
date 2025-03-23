def generate_parentheses(n: int) -> list[str]:
    def go(s: str, o: int, m: int) -> list[str]:
        if not s:
            if m > 0:
                return go(")", o + 1, m - 1)
            return []
        if o > 0:
            if m > 0:
                return go(")" + s, o + 1, m - 1) + (go("(" + s, o - 1, m))
            else:
                return go("(" + s, o - 1, m)
        else:
            if m > 0:
                return go(")" + s, o + 1, m - 1)
        return [s]

    return go("", 0, n)
