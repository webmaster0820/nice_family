class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  #before_action :set_nav, only: [:rediger, :destroy]
  #before_action :set_sub_nav, only: [:rediger, :destroy]
  before_action :authenticate_coach!, only: :rediger

  def gdpr
    @member = Member.all
  end

  def personvern
  end

  def cookies
  end

  def home
    @courses = Course.all.limit(6)
    @cities = City.all
    @course_places = CoursePlace.all
    render layout: 'no_menu'
  end

  def rediger
    @pages = Page.all
    @navs = Nav.all
    @sub_navs = SubNav.all
    @page = Page.find_by_id([@pages])
    @nav = Nav.find_by_id([@navs])
    @sub_nav = SubNav.find_by_id([@sub_navs])
  end

  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to rediger_path, notice: 'Siden ble opprettet.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to rediger_path, notice: 'Siden ble oppdatteret.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to rediger_path, notice: 'Siden ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end
    def set_nav
      @nav = Nav.find(params[:id])
    end
    def set_sub_nav
      @sub_nav = SubNav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content, :city)
    end
end
