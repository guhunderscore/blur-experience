class HomeController < ApplicationController
  def index
  	@galleries = Gallery.all
  end
end
