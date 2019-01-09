class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_coach!, except: [:show]

  # GET /participations
  # GET /participations.json
  def index
    @courses = Course.all.order('day ASC')
    @course = Course.find_by(params[:id])
    @counts = Participation.where(course_id: @course)
    @members = Member.all
    @participations = Participation.all
    @participation = Participation.find_by(params[:id])
    @member = Member.find_by(params[:id])
    @children = Child.all
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end

  # GET /participations/new
  def new
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  # POST /participations.json
  def create
    @participation = Participation.new(participation_params)
    @member = @participation.member_id
    @course = @participation.course_id
    respond_to do |format|
      if @participation.save
        #subscribe
        format.html { redirect_to edit_member_path(@member), notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def subscribe
      gibbon = Gibbon::Request.new(api_key: "a36eb6b7f8545edd6e029a78dcd8dca2-us4")
      gibbon.timeout = 10
      gibbon.lists('#{@course.mailchimp_id}').members.create(
        body:{
          email_address: @member.email,
          status: 'subscribed',
          merge_fields: {FNAME: @member.first_name, LNAME: @member.last_name}
        })
      #SubscribeJob.perform_later(@member)
    end

    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      params.require(:participation).permit(:member_id, :course_id, :child_id, :grandparent_id, :order_id)
    end
end
