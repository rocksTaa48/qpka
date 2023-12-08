module Api
  module V1
    class SubcategoriesController < ApplicationController
      def index
        render(json: Subcategory.order(created_at: :desc))
      end

      def create
        subcategory = Subcategory.create(subcategory_params)
        if subcategory.save
          render(json: subcategory, status: :created)
        else
          render(json: subcategory.errors, status: :unprocessable_entity)
        end
      end

      private

      def subcategory_params
        params.require(:subcategory).permit(:title, :description, :category_id)
      end
    end
  end
end
