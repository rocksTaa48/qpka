module Api
  module V1
    class CategoriesController < ApplicationController
      rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
      def index
        render(json: Category.order(created_at: :desc))
      end

      def create
        category = Category.create(category_params)
        if category.save
          render(json: category, status: :created)
        else
          render(json: category.errors, status: :unprocessable_entity)
        end
      end

      def destroy
        category = Category.find_by(id: params[:id]).destroy!
        head(:no_content)
      end

      private

      def category_params
        params.require(:category).permit(:title, :description)
      end

      def not_destroyed
        render(json: {}, status: :unprocessable_entity)
      end
    end
  end
end
