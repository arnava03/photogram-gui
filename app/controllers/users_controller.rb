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
end
