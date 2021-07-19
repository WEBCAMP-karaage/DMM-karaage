class Customer::OrdersController < ApplicationController
  def create
  end
  
  def new
  end
  
  def confilm
  end
  
  def done
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
  end
end
