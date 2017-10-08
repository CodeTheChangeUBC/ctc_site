class ProjectsController < ApplicationController
    before_action :admin, only: [:new, :create, :update, :destroy]

    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        if  @project.save
            redirect_to projects_url
            flash[:success] = "Projected successfully created!"
        else
            render :new
        end
    end

    def show
        @project = Project.find(params[:id])
    end

    def index
        @first_year = 2016; # first year club was active
        #@projects = Project.all.order(:created_at)
        @projects_by_year = Array.new(Time.current.year-@first_year+1)
        (2016..Time.current.year).each do |year|
            @projects_by_year[year-2016] = Project.all.where(year: year).order(:created_at)
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update 
      @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        flash[:success] = "Project Updated!"
        redirect_to projects_url
      else
        render 'edit'
      end
    end


    def destroy
        Project.find(params[:id]).destroy
        flash[:success] = "Project deleted"
        redirect_back_or projects_url
    end

    private
        def project_params
            params.require(:project).permit(:title, :startDate, :endDate, 
                                            :volCap, :volNum, :githubPage, 
                                            :description, :status, :project_url, 
                                            :avatar, :year)
        end

end

