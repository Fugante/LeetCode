def top_k_frequent_elements(nums: [int], k: int) -> [int]:
    from collections import defaultdict

    freqs = defaultdict(int)
    for n in nums:
        freqs[n] += 1
    ordered_freqs = sorted(freqs.items(), key=lambda p: p[1], reverse=True)
    ans = [ordered_freqs[i][0] for i in range(k)]
    return ans

def top_k_frequent_elements2(nums: [int], k: int) -> [int]:
    from collections import defaultdict

    count = defaultdict(int)
    freq = ([] for i in range(len(nums) + 1))
    for n in nums:
        count[n] += 1
    for n, c in count.items():
        freq[c].append(n)
    ans = []
    c = 0
    for ns in freq[::-1]:
        for n in ns:
            ans.append(n)
            c += 1
            if c == k:
                return ans
