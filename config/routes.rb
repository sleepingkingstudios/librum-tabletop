# frozen_string_literal: true

Librum::Tabletop::Engine.routes.draw do
  resources :publishers, controller: 'view/publishers'
end
