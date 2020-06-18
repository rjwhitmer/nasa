namespace :seed do
  desc "TODO"
  task seed_db: :environment do
    rails db:seed
  end

end
