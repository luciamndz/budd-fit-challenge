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
    if @invite.update(invite_params)
      case @invite.status
      when "Accepted" then redirect_to challenge_path(@invite.challenge)
      when "Declined" then redirect_to profile_path
      end
    else
      render "pages/profile", status: :unprocessable_entity
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:invitee_id, :status)
  end
end
