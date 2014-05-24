class AdminsController < ApplicationController
  def index
  	@admins = Admin.all
  end

  def new
  	@admin = Admin.new
  end
  
  def create
  	@admin = Admin.new
  	@admin.username = params[:admin][:username]
  	@admin.password = params[:admin][:password]
  		if @admin.save
			flash[:notice] = "New admin created."
  			redirect_to admins_path
		else
			@message = @admin.errors.messages
			render :new
		end
		
  end

  def edit
  	@admin = Admin.find(params[:id])
  end
  
  def update
  	@admin = Admin.find(params[:id])
  	@admin.username = params[:admin][:username]
  	@admin.password = params[:admin][:password]
		if @admin.save
			flash[:notice] = "Admin details edited."
  			redirect_to admins_path
		else
			@message = @admin.errors.messages
			render :edit
		end
  	
  end

  def show
 	@admin = Admin.find(params[:id])
  end
  
  def destroy
  	@admin = Admin.find(params[:id])
  	@admin.destroy!
   	redirect_to admins_path 	
  end
end
