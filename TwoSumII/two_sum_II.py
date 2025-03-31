def two_sum(numbers: list[int], target: int) -> list[int]:
    indexed_numbers = list(enumerate(numbers))
    sum = indexed_numbers[0][1] + indexed_numbers[-1][1]
    while target != sum:
        if sum > target:
            indexed_numbers = indexed_numbers[:-1]
        if sum < target:
            indexed_numbers = indexed_numbers[1:]
        sum = indexed_numbers[0][1] + indexed_numbers[-1][1]
    return [indexed_numbers[0][0] + 1, indexed_numbers[-1][0] + 1]

