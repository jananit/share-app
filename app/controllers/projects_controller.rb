class ProjectsController < ApplicationController
	def new 
		@project = Project.new
	end

	  def create
    @project = Project.new(params[:product])
    if @project.save
      flash[:notice] = "Successfully created product."
      redirect_to @project
    else
      render :action => 'new'
    end
  end
  def show
  	@project = Project.find(params[:id])
  end
end
