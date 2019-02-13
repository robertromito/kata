def search(search_for, in_numbers):
    print(f'search for {search_for} in {in_numbers}')

    in_numbers_length = len(in_numbers)

    if in_numbers_length == 0:
        return -1; # Never found for empty list

    if in_numbers_length == 1:
        if in_numbers[0] == search_for:
            return 0
        return -1

    if in_numbers_length == 2:
        if in_numbers[0] == search_for:
            return 0
        elif in_numbers[1] == search_for:
            return 1
        return -1

    mid = in_numbers_length // 2
    mid_number = in_numbers[mid]

    if mid_number == search_for:
        print(f'found {search_for} in position {mid}')
        return mid
    
    if mid_number > search_for:
        return search(search_for, in_numbers[0:mid-1])
    
    return search(search_for, in_numbers[mid+1:])
