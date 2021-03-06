class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]
  before_action :authorize_user, except: [:index, :new, :create, :show, :best]

  def index
    @users = User.all
    @hashtags = Hashtag.all
  end

  def new
    redirect_to(root_url, alert: I18n.t('controllers.users.already_logged_in')) if current_user.present?
    @user = User.new
  end

  def create
    redirect_to(root_url, alert: I18n.t('controllers.users.already_logged_in')) if current_user.present?
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_url, notice: I18n.t('controllers.users.created'))
    else
      render('new')
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(user_path(@user), notice: I18n.t('controllers.users.updated'))
    else
      render('edit')
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to(root_url, notice: I18n.t('controllers.users.destroyed'))
  end

  def show
    @new_question = @user.questions.build
    @questions = @user.questions.order(created_at: :desc)
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  def best
    @new_question = @user.questions.build
    @questions = @user.questions.joins(:likes).distinct.order('likes_count desc')
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count

    render('users/show')
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :gender, :avatar_url, :theme_color)
  end
end
