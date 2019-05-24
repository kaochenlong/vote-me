class CandidatesController < ApplicationController

  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to root_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to root_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to root_path, notice: "資料已刪除"
  end

  def vote
    @candidate.increment(:vote)
    @candidate.save
    redirect_to root_path, notice: '投票完成'
  end

  private

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :platform)
  end
end
