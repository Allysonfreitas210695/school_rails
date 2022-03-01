module ApplicationHelper
  def discipline_all
    Discipline.all.collect { |p| [ p.name, p.id ] }
  end
end
