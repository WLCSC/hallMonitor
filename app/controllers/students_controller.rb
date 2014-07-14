class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :log]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def travel
      if params[:student_id] && params[:status] && (@student = Student.find(params[:student_id]))
          @activity = Activity.new(student_id: @student.id, status: params[:status], destination: (params[:destination] || nil))
          if @activity.save
            redirect_to root_path
          else
              render text: @activity.errors.full_messages.map.join(', ')
          end
      else
          raise 'die'
      end
  end

  def log
      if params[:year] && params[:month] && params[:day]
          d = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
          @activities = @student.activities.where('created_at BETWEEN ? AND ?', d.beginning_of_day, d.end_of_day)
      else
          @activities = @student.activities.last(50);
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :image)
    end
end
