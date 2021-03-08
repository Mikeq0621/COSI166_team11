class SearchesController < ApplicationController

  def search
    if params[:search].blank?
      redirect_to("/", alert: "Empty field!") and return      
    else 
      @results = Host.all.where("zip_code LIKE :search", search: params[:search]) 
    end
  end
end