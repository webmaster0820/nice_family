class GrandparentsController < ApplicationController
  before_action :set_grandparent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, only: :show
  skip_before_action :verify_authenticity_token
  layout 'signup'

  def index
    @grandparents = Grandparent.all
  end

  def show
  end

  # GET /grandparents/new
  def new
    @grandparent = Grandparent.new
    @member = current_member
  end

  def legg_til_besteforelder
    @grandparent = Grandparent.new
  end

  def besteforeldre
    @grandparent = Grandparent.new
    @member = current_member
  end

  def edit
  end

  # POST /grandparents
  # POST /grandparents.json
  def create
    @grandparent = Grandparent.new(grandparent_params)
    @grandparent.member_id = current_member.id if member_signed_in?

    respond_to do |format|
      if member_signed_in?
        if @grandparent.save
          format.html { redirect_to kurv_sjekk_ut_path, notice: 'Besteforeldre ble opprettet' }
          format.json { render :show, status: :created, location: @grandparent }
        else
          format.html { render :new }
          format.json { render json: @grandparent.errors, status: :unprocessable_entity }
        end
      else
        if @grandparent.save
          format.html { redirect_to @grandparent, notice: 'Besteforeldre ble opprettet' }
          format.json { render :show, status: :created, location: @grandparent }
        else
          format.html { render :new }
          format.json { render json: @grandparent.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /grandparents/1
  # PATCH/PUT /grandparents/1.json
  def update
    respond_to do |format|
      if @grandparent.update(grandparent_params)
        format.html { redirect_to @grandparent, notice: 'Besteforeldre ble oppdattert.' }
        format.json { render :show, status: :ok, location: @grandparent }
      else
        format.html { render :edit }
        format.json { render json: @grandparent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grandparents/1
  # DELETE /grandparents/1.json
  def destroy
    @grandparent.destroy
    respond_to do |format|
      format.html { redirect_to grandparents_url, notice: 'Besteforeldre ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grandparent
      @grandparent = Grandparent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grandparent_params
      params.require(:grandparent).permit(:first_name, :last_name, :member_id, :child_id, :course_id, :order_id, :participation_id)
    end
end
