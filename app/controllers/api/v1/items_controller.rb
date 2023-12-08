module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render(json: Item.order(created_at: :desc))
      end

      def create
        item = Item.create(item_params)
        if item.save
          render(json: item, status: :created)
        else
          render(json: item.errors, status: :unprocessable_entity)
        end
      end

      private

      def item_params
        params.require(:item).permit(:name, :description, :quantity, :price, :subcategory_id)
      end
    end
  end
end
