class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @challenges = Challenge.search_by_name_and_activity(params[:query])
    else
      @challenges = Challenge.all
    end

    respond_to do |format|
      format.html
      format.text { render partial: "shared/list", locals: {challenges: @challenges}, formats: [:html]}
    end
  end
end
