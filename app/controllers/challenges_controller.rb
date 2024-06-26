class ChallengesController < ApplicationController
  before_action :set_admin, only: [:show]
  before_action :find_challenge, only: [:show, :destroy]

  def index

    @challenges = Challenge.all
  end

  def show

  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge.new(params_challenge)
    @challenge.user = current_user
    if @challenge.save!
      redirect_to challenge_path(@challenge)
    else
      render new:, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge.destroy!
    redirect_to root_path
  end

  private

  def params_challenge
    params.require(:challenge).permit(:name, :duration,:challenge_type, :activity, :status,:global_score, :user_id)
  end

  def set_admin
    @admin = User.find(@challenge.user_id)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end
end
