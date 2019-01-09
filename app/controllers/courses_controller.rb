class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :status]
  before_action :authenticate_coach!, only: [:edit_courses, :edit, :update, :destroy]
  #require 'gibbon'

  def modal
    respond_to do |format|
      format.html
      format.js
    end
  end

  def oversigt
    @course = Course.new
    @courses = Course.all
    @course_categories = CourseCategory.all
    @course_places = CoursePlace.all
    @course_niveaus = CourseNiveau.all
    @cities = City.all
  end

  def index
    @courses = Course.all.order('day ASC').page(params[:page])
    #@courses = Course.where(Course.statuses[0]).order('day ASC').page(params[:page])
    @course = Course.where(id: @courses)
    @participations = Participation.where(course_id: @course)
    @participation = Participation.where(id: @participations)

    if params[:course_niveau_id].present?
      course_niveau = CourseNiveau.find(params[:course_niveau_id])
      @courses = course_niveau.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:course_place_id].present?
      course_places = CoursePlace.find(params[:course_place_id])
      @courses = course_places.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:course_category_id].present?
      course_category = CourseCategory.find(params[:course_category_id])
      @courses = course_category.courses.page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    if params[:day].present?
      @courses = @courses.where(day: params[:day]).page(params[:page])
     else
      @courses = @courses.page(params[:page])
    end

    @member = Member.new

  end

  def edit_courses
    @courses = Course.all.order('day ASC')
    render :edit_courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @members = Member.all
    @participations = @course.members
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    create_list
    respond_to do |format|
      if @course.save
        create_list
        format.html { redirect_to @course, notice: 'Kurset ble opprettet.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Kurset ble oppdatert.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      mailchimp_client.lists(mailchimp_list_id).webhooks("1694275d82").delete
      format.html { redirect_to courses_url, notice: 'Kurset ble slettet.' }
      format.json { head :no_content }
    end
  end

  private

    def create_list
      gibbon = Gibbon::Request.new(api_key: "a36eb6b7f8545edd6e029a78dcd8dca2-us4", api_endpoint: "https://us4.api.mailchimp.com")
      gibbon.timeout = 10
      gibbon.lists.create(body: {
          name: "#{@course.id} #{@course.course_category.name}",
          contact: {
              company: "Preisler Media",
              address1: "address one",
              address2: "address two",
              city: "Egedal",
              state: "Denmark",
              zip: "3650",
              country: "Denmark",
              phone: "+4542836608"
          },
          permission_reminder: "You are receiving this email, because you subscribed our product.",
          campaign_defaults: {
              from_name: "Jonas Preisler",
              from_email: "jonas.preisler@gmail.com",
              subject: "hello!",
              language: "en"
          },
          email_type_option: true
      })
    end

    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :price, :coach_id, :course_niveau_id, :course_place_id, :course_day_id, :course_category_id, :time_from, :time_to, :course_image, :day, :member_id, :status, :limit)
    end
end
