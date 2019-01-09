class CoursePlacesController < ApplicationController
  before_action :set_course_place, only: [:show, :edit, :update, :destroy]

  # GET /course_places
  # GET /course_places.json
  def index
    @course_places = CoursePlace.all
  end

  # GET /course_places/1
  # GET /course_places/1.json
  def show
    @courses = Course.where(course_place_id: @course_place.id)
  end

  # GET /course_places/new
  def new
    @course_place = CoursePlace.new
  end

  # GET /course_places/1/edit
  def edit
  end

  # POST /course_places
  # POST /course_places.json
  def create
    @course_place = CoursePlace.new(course_place_params)

    respond_to do |format|
      if @course_place.save
        format.html { redirect_to oversigt_path, notice: 'Kurs sted ble opprettet..' }
        format.json { render :show, status: :created, location: @course_place }
      else
        format.html { render :new }
        format.json { render json: @course_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_places/1
  # PATCH/PUT /course_places/1.json
  def update
    respond_to do |format|
      if @course_place.update(course_place_params)
        format.html { redirect_to oversigt_path, notice: 'Kurs sted ble oppdatert.' }
        format.json { render :show, status: :ok, location: @course_place }
      else
        format.html { render :edit }
        format.json { render json: @course_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_places/1
  # DELETE /course_places/1.json
  def destroy
    @course_place.destroy
    respond_to do |format|
      format.html { redirect_to oversigt_path, notice: 'Kurs sted ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_place
      @course_place = CoursePlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_place_params
      params.require(:course_place).permit(:name, :address, :phone, :description, :city_id)
    end
end
