module ListingsHelper

    def num_box_array(num)
        box_arr = Array.new
        box_arr << [ '1 Box', 1 ]
        (2..num).each do |n|
            box_arr << [ n.to_s + ' Boxes', n ]
        end
        return box_arr
    end

    def num_weeks_array(num)
        week_arr = Array.new
        week_arr << [ '1 Week', 1 ]
        (2..num).each do |n|
            week_arr << [ n.to_s + ' Weeks', n ]
        end
        return week_arr
    end
end
