FactoryGirl.define do
  factory :movie do
    title 'Apocalypse Now'
    rating 'PG'
    release_date { 10.years.ago }
    director 'Coppola'
  end
end
