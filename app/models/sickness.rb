class Sickness < ActiveRecord::Base
	validates :name, :symptoms, :description, :causes, :treatment, presence: true
	validates :name, uniqueness: true
end
