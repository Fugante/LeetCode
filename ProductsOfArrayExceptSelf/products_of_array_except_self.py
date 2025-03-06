def products_of_array_except_self(nums: list[int]) -> list[int]:
    pp = [1]
    sp = [1]
    acc = 1
    for n in nums[:-1]:
        acc *= n
        pp.append(acc)
    acc = 1
    for n in nums[:0:-1]:
        acc *= n
        sp.append(acc)
    size = len(pp)
    ans = [sp[size - 1 - i] * pp[i] for i in range(size)]
    return ans

def products_of_array_except_self2(nums: list[int]) -> list[int]:
    size = len(nums)
    ans = [1] * size
    prefix = 1
    for i, n in enumerate(nums):
        ans[i] = prefix
        prefix *= n
    postfix = 1
    for i, n in enumerate(nums[::-1]):
        ans[size - 1 - i] *= postfix
        postfix *= n
    return ans
