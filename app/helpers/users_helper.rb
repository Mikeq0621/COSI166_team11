module UsersHelper

    def relationship_to_host(host,user)
       
        transactions = user.transactions
        transactions.each do |t|
            if host == t.host
                return true
            end

        end
        return false
    end
end
