class KitProductsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    @kit = Kit.find(params[:kit_id])

    respond_to do |format|
      if @kit.products << Product.find(params[:product_id])
        format.html { redirect_to @kit }
      else
        format.html { render :action => "new"}
      end
    end
  end

  def destroy
    @kit_product = KitProduct.find(params[:id])
    @kit_product.destroy
    respond_to do |format|
      format.html {  redirect_to @kit_product.kit }
    end
  end

end
