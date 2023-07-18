class OrderItemsController < ApplicationController
    def index
      @orderItems = OrderItem.all
    end
  
    def show
    end
  
    def new
      @order = OrderItem.new
    end
  
    def edit
    end
  
    def create
      @order = OrderItem.new(order_params)
  
      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @order.update(order_params)
        redirect_to @order, notice: 'Order was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @order.destroy
      redirect_to orderItems_url, notice: 'Order was successfully destroyed.'
    end
  
    private
      def set_order
        @order = OrderItem.find(params[:id])
      end
  
      def order_params
        params.require(:order).permit(:name, :email)
      end
end
  