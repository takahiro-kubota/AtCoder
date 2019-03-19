def gcd(arr) # arr: Array of non-negative integers
  if arr.size < 2
    raise "array (#{arr}) size is less than 2."
  end
  
  def gcd_two(a, b) # assume b <= a
    return a if b %a == 0
    return gcd_two(b % a, a)
  end

  g = arr[0]
  for i in 1..arr.size - 1 do
    g = gcd_two([g, arr[i]].min, [g, arr[i]].max)
  end
  return g
end

def lcm(arr)
  g = gcd(arr)
  arr.map! do |e_i| e_i / g end
  mul = 1
  arr.each do |f_i|
    mul *= f_i
  end
  return mul*g
end
