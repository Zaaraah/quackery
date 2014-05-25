class PagesController < ApplicationController

  def index
	@latest_sicknesses = Sickness.last(3)
  end

  def all
	@sicknesses = Sickness.all
  end

  def about
  end

  def diagnose
  	@sicknesses = Sickness.all
  	@a = []
  	@a_s = Array.new
  	@sicknesses.each do |s|
  		@a = s.symptoms.split(',') #[1] CUA, KEVIN 
  		@a.each do |b|
  			@a_s << b 
  		end	
  	end
  end
  
  def diagnoser
  	@sicknesses = Sickness.all
 	@symptoms = []
 	@diagnosis = []
	begin
 	@stuff = params[:sickness][:options]
 	@stuff.each do |a|
 		if a.empty? == false
 		@symptoms << a
 		end
 	end	
	@sicknesses.each do |s|
		@symptoms.each do |a|	
			#if a == s.symptoms 
			#	@diagnosis << s
			#end 
			if s.symptoms.include?a
				@diagnosis << s
			end
		end
	end	
	rescue
		redirect_to error_path
	end
end

=begin
  def login
  	@username = params[:username]
  	@password = params[:password]
  end
  
  def loginsuccess
  	@admins = Admin.all
	@username = params[:admin][:username]
  	@password = params[:admin][:password]
  	if @username.nil? == true || @password.nil? == true
  		redirect_to error_path
  	else
  		@admins.each do |admin|
  			if admin.username == @username
				if admin.password == @password
					redirect_to error_path
				else
					redirect_to error_path
					return
				end
			else
				redirect_to error_path	
				return		
			end
  		end
  	end	
  end
=end 
  
end