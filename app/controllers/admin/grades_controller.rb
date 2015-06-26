class Admin::GradesController < Admin::AdminController

  def create
    @grade = Grade.new grade_params
    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path }
        format.js   {}
      else
        format.html { redirect_to grades_path }
      end
    end
  end

  def new
    @grade = Grade.new
  end

  def update
    @grade = Grade.find(params[:id])
    pp @grade
    pp 'HHHHHHHHHHHHHHHHHHHHHHHHHHHHh'
    if @grade.update grade_params
      respond_to do |format|
        format.html { redirect_to grades_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def index
    @grades = Grade.all
    @grade = Grade.new
  end

  private

  def grade_params
    params.require(:grade).permit(
        :numeric_grade,
        :self_graded_name,
        :self_graded_synonyms,
        :professionally_graded_name,
        :professionally_graded_synonyms)
  end
end


