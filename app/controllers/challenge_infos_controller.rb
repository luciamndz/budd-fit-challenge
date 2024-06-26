class ChallengeInfosController < ApplicationController

  def edit;end

  def update
    @challenge_info.user_status = "inactive"
  end

end
