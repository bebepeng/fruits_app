class FruitsController < ApplicationController
  def index
    @fruits = Fruit.all
  end

  def new
    @fruit = Fruit.new
  end

  def create
    Fruit.create(:name => params[:name], :description => params[:description])

    redirect_to '/fruits'
  end

  def show
    @fruit = Fruit.find(params[:id])
  end

  def edit
    @fruit = Fruit.find(params[:id])
  end

  def update
    Fruit.update(params[:id], :name => params[:name], :description => params[:description])

    redirect_to "/fruits/#{params[:id]}"
  end

  def destroy
    Fruit.find(params[:id]).destroy

    redirect_to '/fruits'
  end
end