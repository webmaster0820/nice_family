class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  def index
  	@coaches = Coach.all
  end

  def show
	  @coach = Coach.find(params[:id])
    @courses = Course.where(coach_id: @coach)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    def coach_params
      params.require(:coach).permit(:id, :first_name, :last_name, :email, :password, :password_confirmation, :course_id, :profile_pic, :phone)
    end
end