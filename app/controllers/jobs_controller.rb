class JobsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:category].blank?
			@jobs = Job.all.order('created_at DESC')
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id)
		end
	end
	
	def show
		
	end
	
	def new
		@job = Job.new 
	end
	
	def create
		@job = Job.new(jobs_params)
		if @job.save
			redirect_to @job
		else
			render "new"
		end
	end
	
	def edit
		
	end
	def update
		if @job.update(jobs_params)
			redirect_to @job
		else
			render "edit"
		end
	end
	
	def destroy
		@job.destroy
		redirect_to root_path	
	end
	private
	def jobs_params
		params.require(:job).permit(:title, :description, :url, :company, :category_id, :user_id)

	end
	
	def find_job
		@job = Job.find(params[:id])
	end
end
