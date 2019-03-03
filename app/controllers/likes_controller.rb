class LikesController < ApplicationController
  before_action :find_question
  before_action :set_like, only: [:destroy]

  # GET /likes
  def index
    @likes = Like.all
  end

  # POST /likes
  def create
    user = User.find(@question.user.id)

    if current_user.nil?
      flash[:notice] = 'Зарегистрируйтесь на сайте, чтобы ставить лайки к вопросам'
    elsif already_liked?
      flash[:notice] = 'Вы не можете поставить лайк более одного раза'
    else
      flash[:notice] = 'Лайк успешно поставлен'
      @question.likes.create(user_id: current_user.id)
    end

    redirect_to(user_path(user))
  end

  # DELETE /likes/1
  def destroy
    if already_liked?
      @like.destroy
      flash[:notice] = 'Лайк успешно снят'
    else
      flash[:notice] = 'Не можете снять лайк'
    end

    user = User.find(@question.user.id)
    redirect_to(user_path(user))
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
