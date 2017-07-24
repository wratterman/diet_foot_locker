class HomeController < ApplicationController

  def index
    @new_releases = Sneaker.new_releases
  end
end
