namespace :seed do
  desc 'populate db'
  task populate: :environment do

    if Category.count == 0
      puts "Populando Category"
      Category.create(label: "Ação")
      Category.create(label: "Aventura")
      Category.create(label: "Terror")
      Category.create(label: "Ficção")
    end

  end
end
