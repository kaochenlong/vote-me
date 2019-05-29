class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @candidates = Candidate.all.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @candidate = Candidate.new
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)
    authorize @candidate

    if @candidate.save
      redirect_to root_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
    authorize @candidate
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to root_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    authorize @candidate

    @candidate.destroy
    redirect_to root_path, notice: "資料已刪除"
  end

  def vote
    # 從票的角度來新增
    # Vote.create(candidate: @candidate, ip_address: request.remote_ip)

    # v = Vote.new
    # v.candidate = @candidate
    # v.save

    # 從候選人的角度來新增
    # @candidate.votes.create(ip_address: request.remote_ip)

    # 從登入者的角度來新增
    current_user.votes.create!(ip_address: request.remote_ip, candidate: @candidate)

    # 從候選人的角度來新增
    # @candidate.votes.create(ip_address: request.remote_ip, user: current_user)
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
