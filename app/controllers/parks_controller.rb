class ParksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].nil?
      @parks = Park.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    else
      @parks = Park.search(params[:search], :per_page => 8, :page => params[:page])
    end
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

    def sort_column
      Park.column_names.include?(params[:sort]) ? params[:sort] : "Number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
