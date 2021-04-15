module ApplicationHelper

    def get_initials(fullname)
        name_list = fullname.split()
              
        initials = ""
              
        for name in name_list do  # go through each name
          initials += name[0].upcase  # append the initial
        end 
        return initials.first(2)
        
     end
end
