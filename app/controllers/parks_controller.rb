class ParksController < ApplicationController

  def index
    @parks = Park.all.paginate(:per_page => 8, :page => params[:page])
  end

  def show
    @park = Park.find_by_id(params[:id])
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)

    if @park.save
      flash[:notice] = "Park created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @park = Park.find_by_id(params[:id])
  end

  def update
    @park = Park.find_by_id(params[:id])

    if @park.update_attributes(park_params)
      flash[:notice] = "Park updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @park = Park.find_by_id(params[:id])
  end

  def destroy
    park = Park.find_by_id(params[:id]).destroy
    flash[:notice] = "The park '#{park.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def park_params
      params.require(:park).permit(:id, :name, :size, :address)
    end

end
