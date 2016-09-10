class ProjectsController < ApplicationController

    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        if  @project.save
            redirect_to @project
            flash[:success] = "Projected successfully created!"
        else
            render :new
        end
    end

    def show
        #render plain: params[:project].inspect
        @project = Project.find(params[:id])
    end

    def index
        @projects = Project.all
    end

    def edit
    end

    def delete
    end

    private
        def project_params
            #TODO: Add description
            params.require(:project).permit(:title, :startDate, :endDate, :volCap, :volNum, :githubPage)
        end

end

