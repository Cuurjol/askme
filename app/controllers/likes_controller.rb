class LikesController < ApplicationController
  # https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2
  # https://codereview.stackexchange.com/questions/154930/rails-like-and-unlike-posts
  # https://stackoverflow.com/questions/11945487/how-do-you-model-likes-in-rails

  before_action :find_question
  before_action :set_like, only: [:destroy]

  # GET /likes
  def index
    @users = User.find(@question.likes.map(&:user_id))
  end

  # POST /likes
  def create
    user = User.find(@question.user.id)

    if current_user.nil?
      flash[:notice] = I18n.t('controllers.likes.register')
    elsif already_liked?
      flash[:notice] = I18n.t('controllers.likes.already_liked')
    else
      flash[:notice] = I18n.t('controllers.likes.created')
      @question.likes.create(user_id: current_user.id)
    end

    redirect_back(fallback_location: user_path(user))
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
    user = User.find(@question.user.id)
    flash[:notice] = I18n.t('controllers.likes.destroyed')
    redirect_back(fallback_location: user_path(user))
  end

  private

  def set_like
    @like = @question.likes.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, question_id:
        params[:question_id]).exists?
  end
end
