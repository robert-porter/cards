class GradesController < ApplicationController


  def model
    Grade
  end

  def create
    new_record = model.new
    model.columns.each do |c|
      if c.name != 'created_at' && c.name != 'updated_at' && c.name != 'id'
        new_record.send(c.name + '=', params[c.name])
      end
    end
    new_record.save

    redirect_to(grades_path)
  end

  def destroy
    grade = Grade.find(params[:id])
    grade.destroy

    redirect_to(grades_path)
  end

  def index
    @grades = Grade.all
  end
end
