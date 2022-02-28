module StudentsHelper
  def teacher_all
    Teacher.all.collect { |p| [ p.name, p.id ] }
  end
end
