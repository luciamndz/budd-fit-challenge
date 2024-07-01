class InvitesController < ApplicationController

  def new;end

  def create #corregir
    @challenge = Challenge.find(params[:challenge_id])
    @invite = Invite.new(invite_params)
    authorize @invite
    authorize @challenge
    @invite.challenge = @challenge
    @invite.inviter = current_user
    if @invite.save!
      redirect_to challenge_path(@invite.challenge)
    else
      render new:, status: :unprocessable_entity
    end
  end

  def show
    @invite = Invite.find(params[:id])
    authorize @invite
  end

  def edit;end
  def update
    @invite = Invite.find(params[:id])
    authorize @invite
    if @invite.update(invite_params.merge(status: "Accepted"))
      # Crear ChallengeInfo para el usuario invitado
      ChallengeInfo.create!(user: current_user, challenge: @invite.challenge)
      redirect_to challenge_path(@invite.challenge)
    else
      render "pages/profile", status: :unprocessable_entity
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:invitee_id, :status)
  end

  def params_challenge_info
    params.require(:challenge_info).permit(:user_id, :challenge_id, :user_score, :user_status, :attendance)
  end
end
