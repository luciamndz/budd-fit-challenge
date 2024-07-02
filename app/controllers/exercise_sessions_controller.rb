class ExerciseSessionsController < ApplicationController
  before_action :find_exercise_session, only: [:show, :edit, :update, :destroy]
  before_action :find_challenge_info, only: [:new, :create]

  def index
    @exercise_sessions = policy_scope(ExerciseSession)
  end

  def new
    @exercise_session = ExerciseSession.new
    authorize @exercise_session
  end

  def create
    @exercise_session = ExerciseSession.new(params_exercise_sessions)
    authorize @exercise_session
    @exercise_session.challenge_info = @challenge_info
    if @exercise_session.save!
      @challenge_info.increment_score
      redirect_to exercise_session_path(@exercise_session), notice: 'Exercise session was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @challenge_info = ExerciseSession.find(params[:id])
    @exercise_comment = ExerciseComment.new
    authorize @exercise_session
  end

  def edit
    #@exercise_session = ExerciseSession.new
    authorize @exercise_session
  end

  def update
    #authorize @exercise_session
    #@exercise_session.save!
    #redirect_to challenge_path(@exercise_session.challenge_info.challenge)
    #redirect_to challenge_path(@exercise_session.challenge_info.challenge)
    authorize @exercise_session
    if @exercise_session.update(params_exercise_sessions)
      redirect_to challenge_path(@exercise_session.challenge_info), notice: 'Exercise session was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #redirect_to challenge_info_exercise_session_path(@challenge_info, @exercise_session), notice: 'Exercise session was successfully updated.'

  def destroy
    @exercise_session.destroy!
    redirect_to challenge_path(@exercise_session.challenge_info.challenge)
    authorize @exercise_session
  end

  private

  def params_exercise_sessions
    params.require(:exercise_session).permit(:activity, :time_length, :evidence, :description, :like, :created_at, :challenge_info_id, :photo)
  end

  def find_challenge_info
    @challenge_info = ChallengeInfo.find(params[:challenge_info_id])
    unless @challenge_info
      redirect_to root_path, alert: "Challenge Info not found."
    end
  end
  def find_exercise_session
    @exercise_session = ExerciseSession.find(params[:id])
  end
end
