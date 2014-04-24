class FruitsController < ApplicationController
  def index
    @fruits = Fruit.all
  end

  def new
    @fruit = Fruit.new
  end

  def create
    @fruit = Fruit.new(:name => params[:fruit][:name], :description => params[:fruit][:description])
    if @fruit.save
      redirect_to Fruit
    else
      render :new
    end
  end

  def show
    @fruit = Fruit.find(params[:id])
  end

  def edit
    @fruit = Fruit.find(params[:id])
  end

  def update
    @fruit = Fruit.find(params[:id])
    if @fruit.update_attributes(:name => params[:fruit][:name], :description => params[:fruit][:description])
      redirect_to @fruit
    else
      render :edit
    end
  end

  def destroy
    Fruit.destroy(params[:id])

    redirect_to '/fruits'
  end
end