class InvitesController < ApplicationController

  def new
    @invite = Invite.new
    authorize @invite
  end

  def create #corregir
    @invite = Invite.new(params_invite)
    if @invite.save!
      redirect_to challenge_path(@invite.challenge)
    else
      render new:, status: :unprocessable_entity
    end
    authorize @invite
  end

  def show
    @invite = Invite.find(params[:id])
    authorize @invite
  end

  def edit;end

  def update
    # este metodo sirve para cuando un invitee acepte o rechace una invitiacion mandada por un inviter
    if invite.valid?
      invite.save!
      if invite.status == "accepted"
        redirect_to challenge_path(@invite.challenge)
      elsif invite.status == "declined"
        redirect_to root_path
      end
    else
      render new:, status: :unprocessable_entity
    end
    authorize @invite
  end

  private

  def params_invite
    params.require(:invite).permit(:status, :invitee_id, :inviter_id, :challenge_id)
  end
end
