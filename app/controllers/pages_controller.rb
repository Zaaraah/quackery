class PagesController < ApplicationController

  def index
	@latest_sicknesses = Sickness.last(5)
  end

  def all
	@sicknesses = Sickness.all
  end

  def about
  end

end
