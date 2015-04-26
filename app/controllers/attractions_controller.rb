class AttractionsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].nil?
      @attractions = Attraction.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    else
      conditions = {}
      conditions[:order] = :id if params[:order].present? && params[:order][:order] == "id"
      conditions[:order] = 'id desc' if params[:order].present? && params[:order][:order] == "id" && params[:asc][:asc] == "desc"
      conditions[:order] = :type if params[:order].present? && params[:order][:order] == "type"
      conditions[:order] = 'type desc' if params[:order].present? && params[:order][:order] == "type" && params[:asc][:asc] == "desc"
      conditions[:order] = :size if params[:order].present? && params[:order][:order] == "size"
      conditions[:order] = 'size desc' if params[:order].present? && params[:order][:order] == "size" && params[:asc][:asc] == "desc"
      conditions[:order] = :name if params[:order].present? && params[:order][:order] == "name"
      conditions[:order] = 'name desc' if params[:order].present? && params[:order][:order] == "name" && params[:asc][:asc] == "desc"
      conditions[:per_page] = 8
      conditions[:page] = params[:page]
      @attractions = Attraction.search(params[:search], conditions)
      @count = Attraction.search_count params[:search]
    end
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
      flash[:notice] = "Attraction '#{@attraction.name}' created successfully!"
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

    def sort_column
      Attraction.column_names.include?(params[:sort]) ? params[:sort] : "Number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
