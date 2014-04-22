class FruitsController < ApplicationController
  def index

  end

  def new

  end

  def create
    Fruit.create(:name => params[:name], :description => params[:description])

    redirect_to '/fruits'
  end
end