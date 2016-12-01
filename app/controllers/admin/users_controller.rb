module Admin
  class UsersController < AdminController

    def show
      @user =  User.find(:id)
    end

    def index
      @users = User.all
    end
  end

end