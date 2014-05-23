class SicknessesController < ApplicationController

  def index
	@latest_sicknesses = Sickness.last(5)
  end

  def all
	@sicknesses = Sickness.all
  end

  def show
  end

  def new
	@sickness = Sickness.new
  end

  def create
	@sickness = Sickness.new
	@sickness.name = params[:sickness][:name]
	@array_s = params[:sickness][:symptoms].split","
	@sickness.symptoms = @array_s
	@sickness.description = params[:sickness][:description]
	@sickness.causes = params[:sickness][:causes]
	@sickness.treatment = params[:sickness][:treatment]
	@sickness.save!
	redirect_to :action => :index
  end

  def edit
	@sickness = Sickness.find(params[:id])
  end

  def update
	@sickness = Sickness.find(params[:id])
	@sickness.name = params[:sickness][:name]
	@array_s = params[:sickness][:symptoms].split","
	@sickness.symptoms = @array_s
	@sickness.description = params[:sickness][:description]
	@sickness.save!
	redirect_to :action => :show
  end

  def destroy
	@sickness = Sickness.find(params[:id])
	@sickness.destroy!
	redirect_to :action => :show
  end

end
