namespace :dev do
  DISCIPLINE = ['Tecnologia', 'CeT', 'Medicina', 'Goegrafia']
  DEPARTAMENT = ['A', 'B', 'C']
  NOTAS = %w(1 2 3 4 5 6 7 8 9 10)

  desc "configurando o ambiente para dados fakes"
  task setup: :environment do
    spinner_show('Apagando o BD.....') { `rails db:drop` }
    spinner_show('Criando o BD.....') { `rails db:create` }
    spinner_show('Migrando Dados BD.....') { `rails db:migrate` }
    spinner_show('Add Disciplines ao BD.....') { `rails dev:add_disciplines` }
    spinner_show('Add teachers ao BD.....') { `rails dev:add_teachers` }
    spinner_show('Add students ao BD.....') { `rails dev:add_students` }
  end

  desc "Adicionando Disciplina ao sistema"
  task add_disciplines: :environment do
    5.times do |i|
      Discipline.create!(
        name: Faker::Educator.course_name,
        department: Faker::Educator.subject,
        unity1: NOTAS.sample,
        unity2: NOTAS.sample,
        unity3: NOTAS.sample
      )
    end
  end


  desc "Adicionando teachers ao sistema"
  task add_teachers: :environment do
    5.times do |i|
      Teacher.create!(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        discipline: Discipline.all.sample
      )
    end
  end

  desc "Adicionando students ao sistema"
  task add_students: :environment do
    5.times do |i|
      Student.create!(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        discipline: Discipline.all.sample
      )
    end
  end


  private

  def spinner_show(msg_start, msg_end = 'Concluido com sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    yield
    spinner.success(msg_end)
  end
end
