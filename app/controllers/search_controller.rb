class SearchController < ApplicationController

  def index
    @limit = 12
    @page = params[:page].to_i
    @page ||= 0
    @query = params['search'] == "" ? "%" : params['search']
    
    offset = (@page * @limit)

    if params["search"] == "" || params["search"].nil?
      @search = User.order(updated_at: :desc).all
    else
      @search = User.basic_search(email: @query)
    end


    @length = @search != nil ? @search.length : 0 
    @search = @search != nil ? @search.limit(@limit).offset(offset) : [] 
  end

end