module ReviewsHelper

    def stars_icons(stars)
        star_icon = bootstrap_icon("star-fill")
        for i in (2..stars)
            star_icon << bootstrap_icon("star-fill")
        end

        return star_icon
    end

    def star_list()
        star_arr = Array.new
        star_arr << ["1 Star",1]
        star_arr << ["2 Stars",2]
        star_arr << ["3 Stars",3]
        star_arr << ["4 Stars",4]
        star_arr << ["5 Stars",5]
       
        return star_arr
    end
end
