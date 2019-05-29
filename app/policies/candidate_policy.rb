class CandidatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user && user.admin?
  end

  def edit?
    user && user.admin?
  end

  def new?
    user && user.admin?
  end

  def create?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end
end
