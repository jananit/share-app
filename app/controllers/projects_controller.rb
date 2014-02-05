class ProjectsController < ApplicationController

  before_filter :get_lists,:except=>[:show]

	def new 
		@project = Project.new
    flash[:error] = nil
	end

	  def create
     
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Successfully created product."
      redirect_to @project
    else
      flash[:error]  = @project.errors[:avatar].first rescue nil
      render :action => 'new'
    end
  end
  def show
  	@project = Project.find(params[:id])
    @url = @project.get_shorten_url

  end

  private
  def get_lists
     @projects = Project.all
  end
end
