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
        @project = Project.find(params[:id])
    end

    def index
        @projects = Project.all
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update 
      @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        flash[:success] = "Project Updated!"
        redirect_to @project
      else
        render 'edit'
      end
    end


    def delete
    end

    private
        def project_params
            params.require(:project).permit(:title, :startDate, :endDate, 
                                            :volCap, :volNum, :githubPage, 
                                            :description)
        end

end

