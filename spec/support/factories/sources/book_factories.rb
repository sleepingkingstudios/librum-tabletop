# frozen_string_literal: true

FactoryBot.define do
  factory :book,
    class:  'Librum::Tabletop::Sources::Book',
    parent: :publication \
  do
    transient do
      sequence(:book_index) { |index| index }
    end

    name { "Book #{book_index}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-') }

    category         { Librum::Tabletop::Sources::Book::Categories::SOURCEBOOK }
    publication_date { '1982-07-09' }

    trait :adventure do
      category { Librum::Tabletop::Sources::Book::Categories::ADVENTURE }
    end

    trait :bestiary do
      category { Librum::Tabletop::Sources::Book::Categories::BESTIARY }
    end

    trait :reference do
      category { Librum::Tabletop::Sources::Book::Categories::REFERENCE }
    end

    trait :setting do
      with_game_setting

      category { Librum::Tabletop::Sources::Book::Categories::SETTING }
    end

    trait :sourcebook do
      category { Librum::Tabletop::Sources::Book::Categories::SOURCEBOOK }
    end
  end
end
