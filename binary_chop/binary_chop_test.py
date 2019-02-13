import binary_chop as bc

def test_never_found_in_empty_array():
    assert bc.search(1, []) == -1
    assert bc.search(100, []) == -1
    assert bc.search(27, []) == -1

def test_finds_number_when_in_array():
    test_array = [1,2,4,10,25]
    assert bc.search(1, test_array) == 0
    assert bc.search(10, test_array) == 3
