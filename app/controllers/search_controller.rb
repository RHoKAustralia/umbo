class SearchController < ApplicationController

  def index

    #Find therapists that match specialty of patient
    @specialties_array = [];
    @specialties_params = current_user.patient.specialties.includes(therapists: :user)
    @specialties_params.each do |x|
      @specialties_array << x.therapists
    end

    # Sort therapists by most matching specialties
    @specialties_intercept = []
    @specialties_array.flatten.each do |x|
      @specialties_intercept << {therapist: x, count: @specialties_array.flatten.count(x)}
    end

    @specialties_intercept.sort_by! {|obj| obj.count}
    @specialties_intercept.uniq!.reverse!
    
    # Retrieve therapists without count to view
    @search = []
    @specialties_intercept.each do |x|
      @search << x[:therapist]
    end
    
    #TODO: Pagination
    # @limit = 100
    # @page = params[:page].to_i
    # @page ||= 0    
    # offset = (@page * @limit)
    # @length = @search != nil ? @search.length : 0 
    # @search = @search != nil ? @search.limit(@limit).offset(offset) : [] 
  end


  def filter
    @specialties = Specialty.all
  end
end