class SicknessesController < ApplicationController

	@a_s = Array.new
	
  def show
  	@sickness = Sickness.find(params[:id])
  	@a_s
  end

  def new
	@sickness = Sickness.new
  end

  def create
	@sickness = Sickness.new
	@sickness.name = params[:sickness][:name]
	@sickness.symptoms = params[:sickness][:symptoms]
	@sickness.description = params[:sickness][:description]
	@sickness.causes = params[:sickness][:causes]
	@sickness.treatment = params[:sickness][:treatment]
	@sickness.save!
	redirect_to root_path
  end
  
  

  def edit
	@sickness = Sickness.find(params[:id])
  end

  def update
	@sickness = Sickness.find(params[:id])
	@sickness.name = params[:sickness][:name]
	@sickness.symptoms = params[:sickness][:symptoms]
	@sickness.description = params[:sickness][:description]
	@sickness.save!
	redirect_to :action => :show
  end

  def destroy
	@sickness = Sickness.find(params[:id])
	@sickness.destroy!
	redirect_to root_path
  end

end
