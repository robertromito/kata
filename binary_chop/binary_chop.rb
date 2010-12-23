def chop(target, source)

  # One time checks. If these ever fail, no
  # need to recurse
  return -1 if source.empty? or source[0] > target or source[source.length - 1] < target

  from = 0
  to = source.length
  mid = source.length / 2

  while true

    puts "#{from}(from), #{to}(to), #{mid}(mid)"
    
    return mid if source[mid] == target

    if (mid == 0) or (mid == source.length)
      return (source[mid] == target) ? mid : -1
    end

    return -1 if (mid > source.length)

    if source[mid] > target
      to = mid
      mid = mid / 2
    end

    if source[mid] < target
      from = mid
      mid = (to + from)/ 2
    end
  end

  return -1
end
