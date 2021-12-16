"""
Function "timer()".
Get the time elapse of a code(with a context manager).

    Example below:
    print(string) +
    function sleep with "0.25" seconds
"""
import contextlib
import time


@contextlib.contextmanager
def timer():
    start = time.time()
    yield timer()
    end = time.time()
    print('Elapsed: {:.2f}s'.format(end - start))


with timer():
    print('This should take approximately 0.25 seconds')
    time.sleep(0.25)
