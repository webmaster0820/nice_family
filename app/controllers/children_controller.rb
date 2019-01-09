class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, only: [:nytt_barn, :edit]
  skip_before_action :verify_authenticity_token
  
  layout 'signup'

  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
    @member = current_member
  end

  def nytt_barn
    @child = Child.new
  end

  def barn
    @child = Child.new
    @member = current_member
  end
  
  def legg_til_barn
    @child = Child.new
    @member = current_member
  end
  
  def flere
    @child = Child.new
    @member = current_member
  end

  def edit
    @member = current_member
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.new(child_params)
    @child.member_id = current_member.id if member_signed_in?

    respond_to do |format|
      if @child.save
        format.html { redirect_to barn_flere_path, notice: 'Barn ble lagt til.' }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @child, notice: 'Barn ble oppdattert.' }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Barn ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:first_name, :last_name, :member_id, :course_id, :order_id, :birthdate)
    end
end
