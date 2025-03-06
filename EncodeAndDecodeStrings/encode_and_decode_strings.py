def encode(strs: list[str]) -> str:
    header = "".join(chr(len(s)) for s in strs)
    encoded = header + ('\0' * (100 - len(header))) + "".join(strs)
    return encoded

def decode(s: str) -> list[str]:
    header = s[:100]
    strings = s[100:]
    decoded = []
    for h in header:
        n = ord(h)
        s_ = strings[:n]
        strings = strings[n:]
        decoded.append(s_)
        if len(strings) == 0:
            break
    return decoded
