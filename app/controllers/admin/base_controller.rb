class Admin::BaseController < ApplicatioController
  before_action :authenticate_user!
end