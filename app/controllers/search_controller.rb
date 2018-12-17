class SearchController < ApplicationController

  def index
    #Find therapists that match specialty of patient
    @results = []
    if current_user.admin? || current_user.therapist?
      @results = Therapist.all
    else
      if !current_user.patient.specialties.empty?
        @matching_therapists = []
        @patient_specialties = current_user.patient.specialties.includes(therapists: :user)
        @patient_specialties.each do |specialty|
          @matching_therapists << specialty.therapists
        end
        @matching_therapists.flatten!

        # Sort therapists by most matching specialties
        @match_count_hashes = []
        @matching_therapists.each do |therapist|
          @match_count_hashes << { therapist: therapist, count: @matching_therapists.count(therapist) }
        end

        unless @match_count_hashes.empty?
          @match_count_hashes.uniq!
          @match_count_hashes.sort_by! {|hash| hash.count}
          @match_count_hashes.reverse!

          # Retrieve therapists without count to view
          @match_count_hashes.each do |hash|
            @results << hash[:therapist]
          end
        end
      end
    end

    #TODO: Pagination
    # @limit = 100
    # @page = params[:page].to_i
    # @page ||= 0
    # offset = (@page * @limit)
    # @length = @results != nil ? @results.length : 0
    # @results = @results != nil ? @results.limit(@limit).offset(offset) : []
  end

end