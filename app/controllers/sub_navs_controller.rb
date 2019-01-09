class SubNavsController < ApplicationController
  before_action :set_sub_nav, only: [:show, :edit, :update, :destroy]

  # GET /sub_navs
  # GET /sub_navs.json
  def index
    @sub_navs = SubNav.all
  end

  # GET /sub_navs/1
  # GET /sub_navs/1.json
  def show
  end

  # GET /sub_navs/new
  def new
    @sub_nav = SubNav.new
  end

  # GET /sub_navs/1/edit
  def edit
  end

  # POST /sub_navs
  # POST /sub_navs.json
  def create
    @sub_nav = SubNav.new(sub_nav_params)

    respond_to do |format|
      if @sub_nav.save
        format.html { redirect_to rediger_path, notice: 'Sub lenke ble opprettet.' }
        format.json { render :show, status: :created, location: @sub_nav }
      else
        format.html { render :new }
        format.json { render json: @sub_nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_navs/1
  # PATCH/PUT /sub_navs/1.json
  def update
    respond_to do |format|
      if @sub_nav.update(sub_nav_params)
        format.html { redirect_to rediger_path, notice: 'Sub lenke ble oppdatert.' }
        format.json { render :show, status: :ok, location: @sub_nav }
      else
        format.html { render :edit }
        format.json { render json: @sub_nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_navs/1
  # DELETE /sub_navs/1.json
  def destroy
    @sub_nav.destroy
    respond_to do |format|
      format.html { redirect_to rediger_path, notice: 'Sub lenke ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_nav
      @sub_nav = SubNav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_nav_params
      params.require(:sub_nav).permit(:title, :nav_id, :page_id, :number, :link)
    end
end
