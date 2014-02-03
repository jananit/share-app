class ProjectsController < ApplicationController
	def new 
		@project = Project.new
	end

	  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Successfully created product."
      redirect_to @project
    else
      @errors = @project.errors[:avatar]
      render :action => 'new'
    end
  end
  def show
  	project = Project.find(params[:id])
    @url = project.get_shorten_url
  end
end
