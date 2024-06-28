class ExerciseSessionsController < ApplicationController
  before_action :find_exercise_session, only: [:show, :edit, :update, :destroy]

  def index
    @exercise_sessions = policy_scope(ExerciseSession)
  end

  def new
    @challenge_info = ChallengeInfo.find(params[:challenge_info_id])
    @exercise_session = ExerciseSession.new
    authorize @exercise_session
  end

  def create
    @exercise_session = ExerciseSession.new(params_exercise_sessions)
    @challenge_info = ChallengeInfo.find(params[:challenge_info_id])
    @exercise_session.challenge_info = @challenge_info
    if @exercise_session.save!
      redirect_to challenge_path(@exercise_session.challenge_info.challenge)
    else
      render new:, status: :unprocessable_entity
    end
    authorize @exercise_session
  end

  def show
    skip_authorization
    @exercise_comments = ExerciseComment.new
  end

  def edit
    @exercise_session = ExerciseSession.new
  end

  def update
    authorize @exercise_session
    @exercise_session.save!
    redirecto_to challenge_path(@exercise_session.challenge_info.challenge)
    redirecto_to challenge_path(@exercise_session.challenge_info.challenge)
  end

  def destroy
    @exercise_session.destroy!
    redirect_to challenge_path(@exercise_session.challenge_info.challenge)
    authorize @exercise_session
  end

  private

  def params_exercise_sessions
    params.require(:exercise_session).permit(:activity, :time_length, :evidence, :description, :like, :created_at, :challenge_info_id, :photo)
  end

  def find_exercise_session
    @exercise_session = ExerciseSession.find(params[:id])
  end

  def my_friends
    #pendiente
  end

  def like
    #pendiente
  end

end
