class MinStack:
    def __init__(self):
        _stack = []
        _min_stack = []

    def push(self, val: int) -> None:
        self._stack.append(val)
        m = min(self._min_stack[-1], val) if self._min_stack else val
        self._min_stack.append(m)

    def pop(self) -> None:
        self._stack.pop()
        self._min_stack.pop()

    def top(self) -> int:
        return self._stack[-1]

    def get_min(self) -> int:
        return self._min_stack[-1]
