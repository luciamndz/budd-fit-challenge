class ChallengesController < ApplicationController

  before_action :find_challenge, only: [:show, :destroy]
  before_action :set_admin, only: [:show]

  def index
    @challenges = Challenge.all
  end

  def show;
  authorize @challenge
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

  # def challenge_status
  #   #necesita un start date y termina con la duracion
  #   @
  #   if @challenge.status == "created"
  #     @challenge.status = "started" if @challenge.start
  #   elsif @challenge.status == "created"
  #     @challenge.status = "finished"
  #   end


  private

  # def start
  #   @challenge = Challenge.find(params[:id])
  #   @challenge.
  # end

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
