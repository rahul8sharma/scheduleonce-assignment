Rails.application.routes.draw do
  root 'invoice#index'
  post 'invoice/upload_file'
end
