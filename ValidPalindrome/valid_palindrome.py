def is_palindrome(s: str) -> bool:
    s = "".join(filter(str.isalnum, s)).lower()
    n = len(s) // 2
    for i in range(n):
        if s[i] != s[-i - 1]:
            return False
    return True
