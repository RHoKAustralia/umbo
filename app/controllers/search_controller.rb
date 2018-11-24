class SearchController < ApplicationController

  def index
    @limit = 100
    @page = params[:page].to_i
    @page ||= 0
    @query = params['search'] == "" ? "%" : params['search']
    
    offset = (@page * @limit)
    if params["specialty"].nil? || params["specialty"] == "*"
      if params["search"] == "" || params["search"].nil?
        @search = Therapist.order(updated_at: :desc).all
      else
        @search = Therapist.basic_search(@query)
      end
    else
      if params["search"] == "" || params["search"].nil?
        @search = Specialty.find_by(name: params["specialty"]).therapists.order(updated_at: :desc).all
      else
        @search = Specialty.find_by(name: params["specialty"]).therapists.basic_search(@query).order(updated_at: :desc)
      end
    end


    @length = @search != nil ? @search.length : 0 
    @search = @search != nil ? @search.limit(@limit).offset(offset) : [] 
  end

end