Workarea::Storefront::Engine.routes.draw do
  scope '(:locale)', constraints: Workarea::I18n.routes_constraint do
    resources :searches, only: :index
  end
end
