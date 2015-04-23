class ParksController < ApplicationController

  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
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
    @park = Park.find(params[:id])

    if @park.update_attributes(park_params)
      flash[:notice] = "Park updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @group = Park.find(params[:id])
  end

  def destroy
    park = Park.find(params[:id]).destroy
    flash[:notice] = "The park '#{park.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  def c_parks_users
    park = Park.find(params[:id])
    if park.users.include? current_user
      flash[:notice] = "You already joined the park!"
      redirect_to(:action => 'index')
    else
      park.users << current_user
      park.save
      flash[:notice] = "You successfully joined the park!"
      redirect_to(:action => 'show', :id => park.id)
    end
  end

  private

    def park_params
      params.require(:park).permit(:id, :name, :size, :address)
    end


end
