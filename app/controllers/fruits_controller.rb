class FruitsController < ApplicationController
  def index
    @fruits = Fruit.all
  end

  def new

  end

  def create
    Fruit.create(:name => params[:name], :description => params[:description])

    redirect_to '/fruits'
  end

  def read
    @fruit = Fruit.where(:id => params[:id]).first
  end

  def edit
    @fruit = Fruit.where(:id => params[:id]).first
  end

  def update
    Fruit.update(params[:id], :name => params[:name], :description => params[:description])

    redirect_to "/fruits/#{params[:id]}"
  end
end