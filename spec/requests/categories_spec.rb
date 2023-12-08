require 'rails_helper'
require 'faker'
describe 'Categories API', type: :request do
  # GET
  describe 'GET /categories' do
    before do
      (1..10).each do |id|
        FactoryBot.create(
          :category,
          id:,
          title: Faker::Lorem.sentence(word_count: 3),
          description: Faker::Lorem.paragraph(sentence_count: 3)
        )
      end
    end
    it 'returns all categories' do
      get('/api/v1/categories')
      expect(response).to(have_http_status(:success))
      expect(JSON.parse(response.body).size).to(eq(10))
    end
  end
  # CREATE
  describe 'POST /categories' do
    it 'create new category' do
      expect do
        post '/api/v1/categories',
             params: { category: {
               title: Faker::Lorem.sentence(word_count: 3),
               description: Faker::Lorem.paragraph(sentence_count: 3)
             } }
      end.to change { Category.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end
  # DLETE
  describe 'DELETE /categories/:id' do
    let!(:category) do
      FactoryBot.create(:category,
                        title: Faker::Lorem.sentence(word_count: 3),
                        description: Faker::Lorem.paragraph(sentence_count: 3))
    end

    it 'delete category' do
      expect do
        delete "/api/v1/categories/#{category.id}"
      end.to change { Category.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
