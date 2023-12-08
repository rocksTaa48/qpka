require 'rails_helper'
require 'faker'
describe 'Subcategories API', type: :request do
  # GET
  describe 'GET /subcategories' do
    before do
      category = FactoryBot.create(
        :category,
        title: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.paragraph(sentence_count: 3)
      )
      (1..10).each do |id|
        FactoryBot.create(
          :subcategory,
          id:,
          title: Faker::Lorem.sentence(word_count: 3),
          description: Faker::Lorem.paragraph(sentence_count: 3),
          category_id: category.id
        )
      end
    end
    it 'returns all subcategories' do
      get('/api/v1/subcategories')
      expect(response).to(have_http_status(:success))
      expect(JSON.parse(response.body).size).to(eq(10))
    end
  end
  # CREATE
  describe 'POST /subcategories' do
    before do
      category = FactoryBot.create(
        :category,
        title: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.paragraph(sentence_count: 3)
      )
    end
    it 'create new subcategory' do
      expect do
        post '/api/v1/subcategories',
             params: { subcategory: {
               title: Faker::Lorem.sentence(word_count: 3),
               description: Faker::Lorem.paragraph(sentence_count: 3),
               category_id: category.id
             } }
      end.to change { subcategory.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end
  # DLETE
  describe 'DELETE /subcategories/:id' do
    let!(:subcategory) do
      FactoryBot.create(:subcategory,
                        title: Faker::Lorem.sentence(word_count: 3),
                        description: Faker::Lorem.paragraph(sentence_count: 3))
    end

    it 'delete subcategory' do
      expect do
        delete "/api/v1/subcategories/#{subcategory.id}"
      end.to change { subcategory.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
