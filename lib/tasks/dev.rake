namespace :dev do
  DISCIPLINE = %w(tecnologia administracao engenheiro)
  DEPARTAMENT = %w(A B C)
  NOTAS = %w(1 2 3 4 5 6 7 8 9 10)

  desc "configurando o ambiente para dados fakes"
  task setup: :environment do
    spinner_show('Apagando o BD.....') { `rails db:drop` }
    spinner_show('Criando o BD.....') { `rails db:create` }
    spinner_show('Migrando Dados BD.....') { `rails db:migrate` }
    spinner_show('Add teachers ao BD.....') { `rails dev:add_teachers` }
    spinner_show('Add students ao BD.....') { `rails dev:add_students` }
  end

  desc "Adicionando teachers ao sistema"
  task add_teachers: :environment do
    rand(5).times do |i|
      Teacher.create!(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        department: DEPARTAMENT.sample,
        discipline: DISCIPLINE.sample
      )
    end
  end

  desc "Adicionando students ao sistema"
  task add_students: :environment do
    10.times do |i|
      Student.create!(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        unity_one: NOTAS.sample,
        unity_two: NOTAS.sample,
        unity_three: NOTAS.sample,
        teacher: Teacher.all.sample
      )
    end
  end

  private

  def spinner_show(msg_start, msg_end = 'Concluido com sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    yield
    sleep(2)
    spinner.success(msg_end)
  end
end
