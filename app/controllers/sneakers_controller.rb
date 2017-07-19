class SneakersController < ApplicationController

  before_action :set_sneaker, only: [:show]

  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end
end
