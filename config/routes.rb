Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'view_rails', to: "render#rails"
  get 'view_cells', to: "render#cells"
  get 'view_mixed', to: "render#mixed"
end
