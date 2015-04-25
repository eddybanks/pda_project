class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all.paginate(:per_page => 8, :page => params[:page])
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      flash[:notice] = "Attraction created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])

    if @attraction.update_attributes(attraction_params)
      flash[:notice] = "Attraction updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @attraction = Attraction.find_by_id(params[:id])
  end

  def destroy
    attraction = Attraction.find_by_id(params[:id]).destroy
    flash[:notice] = "The attraction '#{attraction.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end


  private

    def attraction_params
      params.require(:attraction).permit(:id, :name, :size, :category, :park_number, :transaction_number)
    end


end
