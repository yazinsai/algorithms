def merge(nums1, m, nums2, n)
  i = 0
  while nums2.any? do
    if i >= nums1.length
      nums1.push nums2.shift
    elsif nums2[0] < nums1[i]
      nums1.insert(i, nums2.shift)
    end
    i += 1
  end
  nums1
end

puts merge([1, 2, 5, 9], 0, [2, 4, 10], 0).inspect
