class InvitesController < ApplicationController
  before_action :find_challenge, only: [:create]
  def new;end

  def create
    @invite = Invite.new(params_invite)
    @invite.user = current_user
    @invite.challenge = @challenge
    if @invite.save!
      redirect_to challenge_path(@challenge)
    else
      render new:, status: :unprocessable_entity
    end
  end

  def show
    @invite = Invite.find(params[:id])
  end

  def edit
    #PENDIENTES
  end

  def update
    #PENDIENTES
  end

  private

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def params_invite
    params.require(:invite).permit(:status, :user_id, :challenge_id)
  end
end
