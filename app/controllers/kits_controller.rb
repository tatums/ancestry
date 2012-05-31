class KitsController < ApplicationController
  
  def index
    @kits = Kit.find(:all)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @kit = Kit.find(params[:id])
    @kit_products = @kit.kit_products
    respond_to do |format|
      format.html
    end
  end

  def new
    @kit = Kit.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @kit = Kit.find(params[:id])
  end

  def create
    if params[:kit_id]
      @kit = Kit.find(params[:kit_id])
      @kit.children.create(params[:kit])
    else
      @kit = Kit.new(params[:kit])
    end

    respond_to do |format|
      if @kit.save
        flash[:notice] = 'Kit was successfully created.'
        format.html { redirect_to(@kit) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @kit = Kit.find(params[:id])

    if params[:child]
      @child_kit = Kit.find(params[:child])
      @child_kit.parent = @kit
      @child_kit.save
    end

    respond_to do |format|
      if @kit.update_attributes(params[:kit])
        flash[:notice] = 'Kit was successfully updated.'
        format.html { redirect_to(@kit) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy
    respond_to do |format|
      format.html { redirect_to(kits_url) }
    end
  end


end
