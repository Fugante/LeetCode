def daily_temperatures(temperatures: list[int]) -> list[int]:
    result = [0 for _ in temperatures]
    indexed_temps = []
    for i, t in enumerate(temperatures):
        while indexed_temps and t > indexed_temps[-1][0]:
            i_, t_ = indexed_temps.pop()
            result[i_] = i - i_
        stack.append((i, t))
    return result

