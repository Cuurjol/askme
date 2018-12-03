class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        name: 'Nikolay',
        username: 'Killer',
        avatar_url: 'https://nameless-badlands-50980.herokuapp.com/frank-sinatra.jpg'
      ),
      User.new(id: 2, name: 'Konstantin', username: 'Korsar')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Nikolay',
      username: 'Killer',
      avatar_url: 'https://nameless-badlands-50980.herokuapp.com/frank-sinatra.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2018')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2018')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2018')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2018'))
    ]

    @new_question = Question.new
  end
end
