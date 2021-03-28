class SearchesController < ApplicationController

  def search
    if params[:search].blank?
      redirect_to("/", alert: "Empty field!") and return      
    else 
      if params[:search_filter] == 'city'
        @results = Host.all.where("city LIKE :search", search: params[:search]) 
      else
        @results = Host.all.where("zip_code LIKE :search", search: params[:search]) 
      end
    end
  end
end