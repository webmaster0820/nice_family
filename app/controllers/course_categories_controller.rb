class CourseCategoriesController < ApplicationController
  before_action :set_course_category, only: [:show, :edit, :update, :destroy]

  # GET /course_categories
  # GET /course_categories.json
  def index
    @course_categories = CourseCategory.all
  end

  # GET /course_categories/1
  # GET /course_categories/1.json
  def show
    @course_niveaus = CourseNiveau.all
  end

  # GET /course_categories/new
  def new
    @course_category = CourseCategory.new
  end

  # GET /course_categories/1/edit
  def edit
  end

  # POST /course_categories
  # POST /course_categories.json
  def create
    @course_category = CourseCategory.new(course_category_params)

    respond_to do |format|
      if @course_category.save
        format.html { redirect_to oversigt_path, notice: 'Kurskategori ble opprettet.' }
        format.json { render :show, status: :created, location: @course_category }
      else
        format.html { render :new }
        format.json { render json: @course_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_categories/1
  # PATCH/PUT /course_categories/1.json
  def update
    respond_to do |format|
      if @course_category.update(course_category_params)
        format.html { redirect_to oversigt_path, notice: 'Kurskategori ble oppdatert.' }
        format.json { render :show, status: :ok, location: @course_category }
      else
        format.html { render :edit }
        format.json { render json: @course_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_categories/1
  # DELETE /course_categories/1.json
  def destroy
    @course_category.destroy
    respond_to do |format|
      format.html { redirect_to course_categories_url, notice: 'Kurskategori ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_category
      @course_category = CourseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_category_params
      params.require(:course_category).permit(:name, :age_from, :age_to, :course_image)
    end
end
