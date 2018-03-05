FactoryBot.define do
  factory :target do
    name              { Faker::Lorem.word }
    department_id     { FactoryBot.create(:department).id }
    category_id       { FactoryBot.create(:category).id }
    unit              { Faker::Lorem.word }
    update_frequency  { [I18n.t(:targets)[:fields][:update_frequency][:monthly], I18n.t(:targets)[:fields][:update_frequency][:yearly]].sample }
    comments          { Faker::Lorem.sentence }
  end
end
