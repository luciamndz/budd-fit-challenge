class ExerciseCommentsController < ApplicationController
  # before_action :find_comment, only: [:edit, :update, :destroy]

  before_action :set_exercise_session, only: [:new, :create,:edit,:update]

  def new
    @exercise_comment = ExerciseComment.new
    authorize @exercise_comment
  end

  def create

    @exercise_comment =ExerciseComment.new(params_comments)
    @exercise_comment.user = current_user
    @exercise_comment.exercise_session = @exercise_session
    if @exercise_comment.save!
      redirect_to exercise_session_path(@exercise_session)
    else
      render new:, status: :unprocessable_entity
    end
    authorize @exercise_comment

  end

  def edit
    @exercise_comment = ExerciseComment.find(params[:id])
    authorize @exercise_comment
  end

  def update
    @exercise_comment = ExerciseComment.find(params[:id])
    # @exercise_comment.user = current_user
    @exercise_comment.update!(params_comments)
    redirect_to exercise_session_path(@exercise_session)
    authorize @exercise_comment
  end

  def destroy
    # @exercise_session = ExerciseSession.find(params[:exercise_session_id])
    # @exercise_comment.exercise_session = @exercise_session
    @exercise_comment = ExerciseComment.find(params[:id])
    authorize @exercise_comment
    @exercise_comment.destroy!
    #redirect_to root_path
  end

  private

  # def find_comment
  #   @exercise_comment =ExerciseComment.new(params[:id])
  # end

  def params_comments
    params.require(:exercise_comment).permit(:comments, :exercise_session_id, :user_id )
  end


  def set_exercise_session
    @exercise_session = ExerciseSession.find(params[:exercise_session_id])
  end
end
