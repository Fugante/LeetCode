def car_fleet(target: int, position: list[int], speed: list[int]) -> int:
    cars = sorted(zip(position, speed))
    times = []
    for p, s in cars[::-1]:
        time = (target - p) / s
        times.append(time)
        if len(times) >= 2 and times[-1] <= times[-2]:
            times.pop()
    return len(times)
