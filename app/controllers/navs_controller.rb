class NavsController < ApplicationController
  before_action :set_nav, only: [:show, :edit, :update, :destroy]

  # GET /navs
  # GET /navs.json
  def index
    @navs = Nav.all
  end

  # GET /navs/1
  # GET /navs/1.json
  def show
  end

  # GET /navs/new
  def new
    @nav = Nav.new
    @pages = Page.all
  end

  # GET /navs/1/edit
  def edit
  end

  # POST /navs
  # POST /navs.json
  def create
    @nav = Nav.new(nav_params)

    respond_to do |format|
      if @nav.save
        format.html { redirect_to rediger_path, notice: 'Meny lenke ble opprettet.' }
        format.json { render :show, status: :created, location: @nav }
      else
        format.html { render :new }
        format.json { render json: rediger_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navs/1
  # PATCH/PUT /navs/1.json
  def update
    respond_to do |format|
      if @nav.update(nav_params)
        format.html { redirect_to rediger_path, notice: 'Meny lenke ble oppdatteret.' }
        format.json { render :show, status: :ok, location: @nav }
      else
        format.html { render :edit }
        format.json { render json: rediger_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navs/1
  # DELETE /navs/1.json
  def destroy
    @nav.destroy
    respond_to do |format|
      format.html { redirect_to rediger_path, notice: 'Meny lenke ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nav
      @nav = Nav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nav_params
      params.require(:nav).permit(:title, :page_id, :number, :link)
    end
end
