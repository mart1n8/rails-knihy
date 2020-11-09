Rails.application.routes.draw do
  root to: "home#index" 
  devise_for :users, path: '', path_names: { sign_in: 'prihlasit', sign_out: 'odhlasit', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'registracia', sign_up: '' }

end
