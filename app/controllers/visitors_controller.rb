class VisitorsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].nil?
      @visitors = Visitor.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    else
      @visitors = Visitor.search(params[:search], :per_page => 8, :page => params[:page])
    end
  end

  def show
    @visitor = Visitor.find_by_id(params[:id])
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)

    # To replace date_select (i1,i2, ..) values to Date
    visitor = params[:visitor]
    birthday = Date.new visitor["birthday(1i)"].to_i, visitor["birthday(2i)"].to_i, visitor["birthday(3i)"].to_i
    @visitor.birthday = birthday

    if @visitor.save
      flash[:notice] = "Visitor created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @visitor = Visitor.find_by_id(params[:id])
  end

  def update
    @visitor = Visitor.find_by_id(params[:id])

    # To replace date_select (i1,i2, ..) values to Date
    visitor = params[:visitor]
    birthday = Date.new visitor["birthday(1i)"].to_i, visitor["birthday(2i)"].to_i, visitor["birthday(3i)"].to_i
    visitor.delete("birthday(1i)")
    visitor.delete("birthday(2i)")
    visitor.delete("birthday(3i)")
    visitor[:birthday] = birthday

    if @visitor.update_attributes(visitor_params)
      flash[:notice] = "Visitor updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @visitor = Visitor.find_by_id(params[:id])
  end

  def destroy
    visitor = Visitor.find_by_id(params[:id]).destroy
    flash[:notice] = "The visitor with visitor ID '#{visitor.id}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def visitor_params
      params.require(:visitor).permit(:id, :name, :gender, :birthday)
    end

    def sort_column
      Visitor.column_names.include?(params[:sort]) ? params[:sort] : "ID"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
