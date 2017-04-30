# Source: https://www.interviewbit.com/problems/add-one-to-number/

def plusOne(a)
  # get rid of leading 0's
  while (a[0] == 0) do a.shift end
  a = [0] if a.empty?

  # add
  a[-1] = (a[-1] + 1) % 10
  carry = a[-1].zero? ? 1 : 0
  for i in (a.length - 2).downto(0)
    break if carry.zero?

    a[i] = (a[i] + 1) % 10
    carry = a[i].zero? ? 1 : 0
  end
  a.unshift(carry) if !carry.zero?

  a
end
