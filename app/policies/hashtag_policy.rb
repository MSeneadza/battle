class HashtagPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @hashtag = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

end
