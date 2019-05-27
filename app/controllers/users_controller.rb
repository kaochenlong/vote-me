class UsersController < ApplicationController
  before_action :authenticate_user!

  def history
  end
end
