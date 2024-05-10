class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({:template => "user_templates/index"})
  end

  def show
    the_username = params.fetch("username")
    @user = User.all.where({:username => the_username}).at(0)

    render({:template => "user_templates/show"})
  end

  def update
    the_username = params.fetch("username")
    user = User.all.where({:username => the_username}).at(0)

    user.username = params.fetch("input_username")
    user.save

    redirect_to("/users/#{user.username}")
  end
  
  def create
    user = User.new
    user.comments_count = 0
    user.likes_count = 0
    user.private = false
    user.username = params.fetch("input_username")
    user.save

    redirect_to("/users/#{user.username}")
  end
end
