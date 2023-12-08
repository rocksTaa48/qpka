Rails.application.routes.draw do
  namespace(:api) do
    namespace(:v1) do
      resources(:categories, only: %i[index create destroy])
      resources(:subcategories, only: %i[index create destroy])
      resources(:items, only: %i[index create destroy])
    end
  end
end
