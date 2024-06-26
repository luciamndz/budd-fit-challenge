class ChallengesController < ApplicationController

  before_action :find_challenge, only: [:show, :destroy]
  before_action :set_admin, only: [:show]

  def index
    @challenges = Challenge.all
  end

  def show;end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params_challenge)
    @challenge.user = current_user
    if @challenge.save!
      redirect_to challenge_path(@challenge)
    else
      render new:, status: :unprocessable_entity
    end
  end

  def destroy
    if @challenge.user == current_user
      @challenge.destroy!
      redirect_to root_path
    else
      render show:, status: :forbidden
    end
  end

  private

  def params_challenge
    params.require(:challenge).permit(:name, :duration, :challenge_type, :activity, :status, :global_score, :user_id)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def set_admin
    @admin = User.find(@challenge.user_id)
  end
end
