class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :check_member, only: [:show]

  def new
    @order = current_cart.order
    @items = current_cart.order.items
    render layout:'order'
  end

  def index
    @orders = Order.where(member_id: current_member.id)
    @courses = Course.all
  end

  def show
    @order_items = OrderItem.where(order_id: @order.id)
    @participations = Participation.where(order_id: @order)
    #@grandparents = Grandparent.where(order_id: @order)
  end

  def create
    @order = current_cart.order
    @items = current_cart.order.items
    #@children = current_member.children
    @children = Child.find(params[:child_ids])
    @grandparent = Grandparent.find(params[:grandparent_id]) if @grandparent.present?
    @order.member_id = current_member.id

    @children.each do |child|
      @items.each do |item|
        Participation.create!([{member_id: "#{current_member.id}", course_id: "#{item.course.id}", child_id: "#{child.id}", grandparent_id: "#{@grandparent.id if @grandparent.present?}", order_id: "#{@order.id}"}])
      end
    end

    @items.each do |i|
      @participations = Participation.where(course_id: i.course)
      if @participations.count == i.course.limit
        i.course.fullbooket!
      end
    end

    @first_item = @items.first
    @course = @first_item.course
    @participations = Participation.where(course_id: @course)
    if @participations.count == @course.limit
      @course.fullbooket!
    end

    if @order.update_attributes(order_params.merge(status: 'open'))
      session[:cart_token] = nil
      redirect_to @order, notice: "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 130.2 130.2'>
  <circle class='path circle' fill='none' stroke='#73AF55' stroke-width='6' stroke-miterlimit='10' cx='65.1' cy='65.1' r='62.1'/>
  <polyline class='path check' fill='none' stroke='#73AF55' stroke-width='6' stroke-linecap='round' stroke-miterlimit='10' points='100.2,40.2 51.5,88.8 29.8,67.5 '/>
</svg>
<br>
<p class='success' style='text-align: center;margin: 20px 0 60px;font-size: 1.25em;'>Ordre gennemført!</p>"
    else
      render :new
    end

  end

  private

  def check_member
    #if current_member.id != @order.member_id
      #redirect_to root_url, alert: "Kan ikke finde din ordre."
    #end
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :member_id, :email, :sub_total, members_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :id, :destroy])
  end

end
