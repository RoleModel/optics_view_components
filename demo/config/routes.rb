# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/lookbook/')
  mount Lookbook::Engine, at: '/lookbook'
  root 'home#index'
end
