class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart
  before_action :nav, :sub_nav

	def not_found
		rescue_from ActiveRecord::RecordNotFound, with: :not_found
	end

	def search
		@children = Child.ransack(name_cont: params[:q]).result(distinct: true)
		@members = Member.ransack(name_cont: params[:q]).result(distinct: true)

		respond_to do |format|
			format.html {}
			format.json {
				@children = @children.limit(5)
				@members = @members.limit(5)
			}
		end
	end
	
  def current_cart
  	@current_cart ||= ShoppingCart.new(token: cart_token)
  end

  helper_method :current_cart

	require 'ostruct'

	helper_method :current_coach
	helper_method :current_member

	#def current_coach
	#  @current_coach ||= Coach.find session[:coach_id] if session[:coach_id]
	#  if @current_coach
	#    @current_coach
	#  else
	#    OpenStruct.new(name: 'Gæst')
	#  end
	#end
	#def current_member
	#  @current_member ||= Member.find session[:member_id] if session[:member_id]
	#  if @current_member
	#    @current_member
	#  else
	#    OpenStruct.new(name: 'Gæst')
	#  end
	#end

	private

	def cart_token
		return @cart_token unless @cart_token.nil?

		session[:cart_token] ||= SecureRandom.hex(8)
		@cart_token = session[:cart_token]
	end

  protected

  def after_sign_in_path_for(resource)
		case resource.class
    when current_coach
      members_path  
    when current_member
      courses_path
    end
  end

  def nav
  	@navs = Nav.all.order('number ASC')
  end
  def sub_nav
  	@sub_navs = SubNav.all.order('number ASC')
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :course_id, :profile_pic, :phone, :gdpr])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :course_id, :profile_pic, :phone])
    #in keys you list all the input you want to accept.
  end

end
