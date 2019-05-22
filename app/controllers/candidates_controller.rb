class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    # /candidates/:id/
    @candidate = Candidate.find_by(id: params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      flash[:notice] = '新增成功'
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      flash[:notice] = "更新成功"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :platform)
  end
end
