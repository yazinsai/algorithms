def fizzbuzz(n)
  for i in 1...n
    print "Fizz" if i % 3 == 0
    print "Buzz" if i % 5 == 0
    print i if (i % 3 != 0) && (i % 5 != 0)
    puts
  end
end

fizzbuzz(100)
