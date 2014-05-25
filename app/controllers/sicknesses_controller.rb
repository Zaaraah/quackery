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
	if @sickness.save
			flash[:notice] = "New sickness created."
  			redirect_to sicknesses_path
		else
			render :new
		end	
  end
  
  def index
  	@sicknesses = Sickness.all
  end

  def edit
	@sickness = Sickness.find(params[:id])
  end

  def update
	@sickness = Sickness.find(params[:id])
	@sickness.name = params[:sickness][:name]
	@sickness.symptoms = params[:sickness][:symptoms]
	@sickness.description = params[:sickness][:description]
	@sickness.causes = params[:sickness][:causes]
	@sickness.treatment = params[:sickness][:treatment]
	if @sickness.save
			flash[:notice] = "Sickness edited."
  			redirect_to sicknesses_path
		else
			@message = @admin.errors.messages
			render :edit
		end
  end

  def destroy
	@sickness = Sickness.find(params[:id])
	@sickness.destroy!
	redirect_to sicknesses_path
  end

end
