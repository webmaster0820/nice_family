class Members::ProfilesController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]


  def profile
	  @member = Member.find(params[:id])
  end

  def all
  	@members = Member.all
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
end