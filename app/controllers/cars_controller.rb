class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def edit
    @car = Car.find(params[:id])
  end

  # def delete
  #   @car = Car.find(params[:id]).destroy
  #   delete_message = "#{@car.year} #{@car.make} #{@car.model} deleted"
  #   if @car.delete(car_params)
  #     redirect_to cars_path, notice: delete_message
  #   else
  #     redirect_to root_path
  #   end
  # end

  def update
    @car = Car.find(params[:id])
    update_message = "#{@car.year} #{@car.make} #{@car.model} updated"
    if @car.update(car_params)
      redirect_to cars_path, notice: update_message
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"

    if @car.save
      redirect_to cars_path,
                  notice: creation_message
    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end
