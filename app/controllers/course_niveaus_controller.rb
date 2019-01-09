class CourseNiveausController < ApplicationController
  before_action :set_course_niveau, only: [:show, :edit, :update, :destroy]

  # GET /course_niveaus
  # GET /course_niveaus.json
  def index
    @course_niveaus = CourseNiveau.all
  end

  # GET /course_niveaus/1
  # GET /course_niveaus/1.json
  def show
  end

  # GET /course_niveaus/new
  def new
    @course_niveau = CourseNiveau.new
  end

  # GET /course_niveaus/1/edit
  def edit
  end

  # POST /course_niveaus
  # POST /course_niveaus.json
  def create
    @course_niveau = CourseNiveau.new(course_niveau_params)

    respond_to do |format|
      if @course_niveau.save
        format.html { redirect_to oversigt_path, notice: 'Kursnivå ble opprettet.' }
        format.json { render :show, status: :created, location: @course_niveau }
      else
        format.html { render :new }
        format.json { render json: @course_niveau.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_niveaus/1
  # PATCH/PUT /course_niveaus/1.json
  def update
    respond_to do |format|
      if @course_niveau.update(course_niveau_params)
        format.html { redirect_to oversigt_path, notice: 'Kursnivå ble oppdattert.' }
        format.json { render :show, status: :ok, location: @course_niveau }
      else
        format.html { render :edit }
        format.json { render json: @course_niveau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_niveaus/1
  # DELETE /course_niveaus/1.json
  def destroy
    @course_niveau.destroy
    respond_to do |format|
      format.html { redirect_to oversigt_path, notice: 'Kursnivå ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_niveau
      @course_niveau = CourseNiveau.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_niveau_params
      params.require(:course_niveau).permit(:name, :description)
    end
end
