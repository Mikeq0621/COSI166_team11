module HostsHelper

    def avg_rating(host)
        if host.reviews.size == 0
            return 0
        end
        rating_total = 0
        host.reviews.each do |r|
            rating_total += r.stars
        end
        
        rating_avg = (rating_total/host.reviews.size).round()
    end
end
