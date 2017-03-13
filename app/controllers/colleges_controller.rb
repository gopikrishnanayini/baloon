class CollegesController < ApplicationController
  def index
    @college = College.all
  end
  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'college was successfully created.' }
        format.json { render json: @college, status: :created, location: @college }
      else
        format.html { render action: 'new' }
        format.json { render json:@college.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @college = College.find(params[:id])
  end
  def edit 
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: 'college was successfully created.' }
        format.json { render json: @college, status: :update, location: @college }
      else
        format.html { render action: 'update' }
        format.json { render json:@college.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @college = College.find(params[:id])
    @college.destroy
     redirect_to colleges_path
  end
        
  private
    def college_params
       params.require(:college).permit(:name, :address)
  end  
end
