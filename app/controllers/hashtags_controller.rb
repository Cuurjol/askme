class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]

  # GET /hashtags/hashtag_name
  def show
    @questions = @hashtag.questions.order(created_at: :desc)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hashtag
    @hashtag = Hashtag.find_by(name: params[:name].downcase)
  end
end
