Rails.application.routes.draw do
  get 'macro_polo/get_marco_polo'

  root 'invoice#index'
  post 'invoice/upload_file'
  get 'macro_polo/get_marco_polo'
end
