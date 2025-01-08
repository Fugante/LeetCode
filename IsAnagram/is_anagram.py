def is_anagram(s: str, t: str) -> bool:
    letters = {}
    letters_ = {}
    for l in s:
        if l not in letters:
            letters[l] = 0
        letters[l] += 1
    for l in t:
        if l not in letters_:
            letters_[l] = 0
        letters_[l] += 1
    if letters.keys() != letters_.keys():
        return False
    for l in letters:
        if letters[l] != letters_[l]:
            return False
    return True

# Most efficient solution
def is_anagram_(s: str, t: str) -> bool:
    count = [0] * 26
    # Count the frequency of characters in string s
    for x in s:
        count[ord(x) - ord('a')] += 1
    # Decrement the frequency of characters in string t
    for x in t:
        count[ord(x) - ord('a')] -= 1
    # Check if any character has non-zero frequency
    for val in count:
        if val != 0:
            return False
    return True


if __name__ == "__main__":
    r = is_anagram("roma", "omar")
    print(r)
