class HomeController < ApplicationController
  before_filter :authenticate_athlete!

  def index
  end
end
