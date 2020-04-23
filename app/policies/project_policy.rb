class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
    @project.has_as_user_or_member?(@user)
  end

  def destroy?
    current_user_is_owner?
  end

  def update?
    @project.has_as_user_or_member?(@user)
  end

  private

  def current_user_is_owner?
    @user == @project.user
  end
end
