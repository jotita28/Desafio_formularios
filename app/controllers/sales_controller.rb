class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  
  def create
    
    detail = params[:sale][:detail]
    category = params[:sale][:category].to_i
    value = params[:sale][:value].to_i
    discount = params[:sale][:discount].to_i
    tax = params[:sale][:tax]
    discount_f = (discount / 100.to_f)
    discount_r = value * discount_f
    price = value - discount_r

    if tax == '0'
      Sale.create(cod: rand(1..1000000), detail: detail, category: category, value: value, discount: discount, tax: tax, total: price)
      
      redirect_to sales_done_path, notice: 'El recurso fue creado'
    else
      total = price.to_f + (price.to_f*0.19)
      
      Sale.create(cod: rand(1..1000000), detail: detail,  category: category, value: value, discount: discount, tax: tax, total: total)
  
      redirect_to sales_done_path, notice: 'El recurso fue creado'
    end
  end

  def done
  @sale = Sale.last
  end
end