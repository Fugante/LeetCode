def group_anagrams(strs: [str]) -> [[str]]:
    anagrams = {}

    for s in strs:
        k = str.join("", sorted(s))
        if k in anagrams:
            anagrams[k].append(s)
        else:
            anagrams[k] = [s]

    answer = [al for al in anagrams.values()]
    return answer
