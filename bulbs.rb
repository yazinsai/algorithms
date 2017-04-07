class Solution
    # param a : array of integers
    #return an integer
    def bulbs(a)
        # starting from the left, trigger non-1 switches
        pressed = 0
        
        for i in 0..a.length-1
            state = pressed % 2 == 0 ? a[i] : 1 - a[i]
            pressed += 1 unless state == 1
        end

        pressed
    end
end

puts Solution.new.bulbs([0, 1, 0, 1, 0 , 0])
