def contains_duplicate(nums: list[int]) -> bool:
    nums_set = set()
    for n in nums:
        if n in nums_set:
            return True
        nums_set.add(n)
    return False


if __name__ == "__main__":
    r = contains_duplicate([1,1,3,5])
    print(r)
