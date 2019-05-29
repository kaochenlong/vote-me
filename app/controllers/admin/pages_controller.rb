class Admin::PagesController < Admin::BaseController
  def index
    authorize Candidate
  end
end
