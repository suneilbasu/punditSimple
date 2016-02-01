class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.student?
  end

  def show?
    @current_user.admin? || @current_user == @user
  end

  def update?
    @current_user.admin?
  end

 
end