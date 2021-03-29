class SearchesController < ApplicationController

  def search
    if params[:search].blank?
      redirect_to("/", alert: "Empty field!") and return      
    else 
      if params[:search_filter] == 'city'
        @results = Host.all.where("city LIKE :search", search: params[:search]) 
      elsif params[:search_filter] == 'duration'
        host_listings = Host.joins(:listings).where("hosts.id = listings.host_id")
        @results = host_listings.all.where("duration > :search", search: params[:search])
      elsif params[:search_filter] == 'box'
        host_listings = Host.joins(:listings).where("hosts.id = listings.host_id")
        @results = host_listings.all.where("space > :search", search: params[:search])
      else
        @results = Host.all.where("zip_code LIKE :search", search: params[:search]) 
      end
    end
  end

  
end