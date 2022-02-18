namespace :dev do
  DISCIPLINE = %w(tecnologia administracao engenheiro)
  DEPARTAMENT = %w(A B C)
  NOTAS = %w(1 2 3 4 5 6 7 8 9 10)

  desc "configurando o ambiente para dados fakes"
  task setup: :environment do
    puts 'Criando os dados!'
    %x(rails db:drop)
    puts 'criando BD'
    %x(rails db:create)
    puts 'Migrando Dados BD'
    %x(rails db:migrate)
    puts 'Add teachers'
    %x(rails dev:add_teachers)
    puts 'Add students'
    %x(rails dev:add_students)
    puts 'finalizado com sucesso!'
  end

  desc "Adicionando teachers ao sistema"
  task add_teachers: :environment do
    rand(5).times do |i|
      Teacher.create(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        department: DEPARTAMENT.sample,
        discipline: DISCIPLINE.sample
      )
    end
  end

  desc "Adicionando students ao sistema"
  task add_students: :environment do
    rand(5).times do |i|
      Student.create(
        name: Faker::Name.name,
        registration: Faker::Number.number(digits: 5),
        unity_one: NOTAS.sample,
        unity_two: NOTAS.sample,
        unity_three: NOTAS.sample,
        teacher: Teacher.all.sample
      )
    end
  end
end
