def two_sum(nums: list[int], target: int) -> list[int]:
    solutions = {}
    for i, n in enumerate(nums):
        m = target - n
        if n not in solutions:
            if m not in solutions:
                solutions[n] = [i]
            else:
                solutions[m].append(i)
        elif 2 * n == target:
            solutions[n].append(i)
    for v in solutions.values():
        if len(v) == 2:
            return v


# most efficient solution
def two_sum_(nums: list[int], target: int) -> list[int]:
    numMap = {}
    n = len(nums)

    for i in range(n):
        complement = target - nums[i]
        if complement in numMap:
            return [numMap[complement], i]
        numMap[nums[i]] = i

    return []  # No solution found


if __name__ == "__main__":
    r = two_sum([2, 7, 11, 15], 9)
    print(r)
