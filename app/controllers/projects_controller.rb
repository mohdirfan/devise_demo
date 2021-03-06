class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]	
	before_filter :check_permission, :only => [:edit, :update, :destroy]
	#inherited resource
	make_resourceful do
		actions :all
		before :create do
			current_object.user_id = current_user.id
		end
	end

	def check_permission
		if current_user.id != current_object.user_id
			flash[:error] = 'Permission denied!'
			redirect_to root_path
		end
	end

=begin	
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    #if @project.user_id != current_user.id
    #	@project = nil
    #end
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
		#if @project.user_id != current_user.id
    	#render :action => 'index'
      #render_to :xml => @project.errors, :status => :unprocessable_entity
  	#else
	    respond_to do |format|
	    	
	      if @project.update_attributes(params[:project])
	        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
	        format.xml  { head :ok }
	      else
	        format.html { render :action => "edit" }
	        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
	      end
	    end
	  #end  
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end  
=end		
end
