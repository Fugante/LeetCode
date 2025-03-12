def longest_consecutive(nums: list[int]) -> int:
    if not nums:
        return 0
    sorted_nums = sorted(nums)
    longest = 1
    count = 1
    n0 = sorted_nums[0]
    for n in sorted_nums[1:]:
        if n == n0:
            continue
        if n - n0 == 1:
            count += 1
            n0 = n
        else:
            longest = max(longest, count)
            count = 1
            n0 = n
    return max(longest, count)

def longest_consecutive2(nums: list[int]) -> int:
    nums_set = set(nums)
    longest = 0
    for n in nums:
        if n - 1 in nums_set:
            continue
        count = 0
        while (n + count) in nums_set:
            count += 1
        longest = max(longest, count)
    return longest
