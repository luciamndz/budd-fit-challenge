class ChallengeInfosController < ApplicationController

  before_action :find_challenge_info, only: [:show, :change_status]
  def new
    @challenge_info = ChallengeInfo.new
  end
  def create
    @challenge_info = ChallengeInfo.new(params_challenge_info)
    @challenge_info.user = current_user
    if @challenge_info.save!
      redirect_to challenge_path(@challenge_info.challenge)
    else
      render new:, status: :unprocessable_entity
    end
  end
  def update
    @challenge_info = ChallengeInfo.find(params[:id])
    @challenge_info.user_status = "inactive"
    authorize @challenge_info
    @challenge_info.save!
    redirect_to challenge_path(@challenge_info.challenge)
  end

  def edit;end

  def show;end

  def top;end

  private
  def find_challenge_info
    @challenge_info = ChallengeInfo.find(params[:id])
  end
  def params_challenge_info
    params.require(:challenge_info).permit(:user_id, :challenge_id, :user_score, :user_status, :attendance)
  end
end
