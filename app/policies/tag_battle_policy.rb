class TagBattlePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @tag_battle = model
  end

  def index?
    true
  end

  def new?
    @current_user
  end

  def create?
    @current_user
  end

  def show?
    @current_user.admin? || @tag_battle.user == @current_user
  end

  def update?
    @current_user.admin? || @tag_battle.user == @current_user
  end

  def destroy?
    @current_user.admin? || @tag_battle.user == @current_user
  end

end
