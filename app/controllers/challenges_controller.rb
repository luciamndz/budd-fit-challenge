class ChallengesController < ApplicationController

  before_action :find_challenge, only: [:show, :destroy, :top]
  before_action :set_admin, only: [:show]

  def index
    @challenges = Challenge.all
  end

  def show;
    @invite = Invite.new
    authorize @challenge
    authorize @invite
  end

  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  def create
    @challenge = Challenge.new(params_challenge)
    @challenge.user = current_user
    if @challenge.save!
      redirect_to challenge_path(@challenge)
    else
      render new:, status: :unprocessable_entity
    end
    authorize @challenge
  end

  def destroy
    authorize @challenge
    @challenge.destroy!
    redirect_to root_path, status: :see_other
  end
  #>>>>>>>>>>>>>>>>
  # def challenge_status
  # if Date.today == @challenge.start_date.value
  # @challenge.status = "started"
  # elsif @Date.today == @challenge.end_date.value
  # @challenge.status = "finished"
  # end
  #   end
  #>>>>>>>>>>>>>>>>>>>>>>

  private

  # def start
  #   @challenge = Challenge.find(params[:id])
  #   @challenge.
  # end

  def params_challenge
    params.require(:challenge).permit(:name, :duration, :challenge_type, :activity, :status, :global_score, :user_id, :start_date, :end_date)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def set_admin
    @admin = User.find(@challenge.user_id)
  end
end
