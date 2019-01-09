class EmailsController < ApplicationController
  before_action :set_email, only: [:sender, :show, :send_email, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_coach!, except: [:gdpr]

  def send_email
  end


  def index
    @emails = Email.all.order('created_at DESC')
    #gibbon = Gibbon::Request.new(api_key: "a36eb6b7f8545edd6e029a78dcd8dca2-us4", debug: true)
    #gibbon.timeout = 10
    #@lists = gibbon.lists.retrieve
    #@lists = gibbon.lists(params: {"fields": "lists.id,lists.name"})
    #@lists = gibbon.lists("my_list_id").members.retrieve(params: {"fields": "members.email_address"})
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.coach_id = current_coach.id
    if @email.course.present?
      @email.kurs!
    elsif @email.member.present?
      @email.deltaker!
    end

    respond_to do |format|
      if @email.save
        format.html { redirect_to emails_path, notice: 'E-postutkast ble opprettet.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course = @email.course
    @coach = current_coach
    @member = @email.member
    @participations = Participation.where(course_id: @course)
    if @email.course.present?
      @email.sendt!
      EmailMailer.send_replacement_request(@email,@course,@participations)
    elsif @email.member.present?
      @email.sendt!
      EmailMailer.quick_mail(@email,@member).deliver
    end
    #@email.status = "sendt"

    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to emails_path, notice: 'E-post ble sendt.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:subject, :content, :course_id, :member_id, :coach_id, :status)
    end
end
