Rails.application.routes.draw do
  root to: 'home#index' 
  devise_for :users, path: '', path_names: { sign_in: 'prihlasit', sign_out: 'odhlasit', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'registracia', sign_up: '' }


  namespace :admin do
    #NATIONS
    get 'narodnosti', to: 'nations#index', as: 'nations'
    post 'narodnosti', to: 'nations#create', as: 'add_nation'
    get 'narodnosti/:id/upravit', to: 'nations#edit', as: 'edit_nation'
    patch 'narodnosti/:id/upravit', to: 'nations#update'
    delete 'narodnosti/:id/vymazat', to: 'nations#destroy', as: 'delete_nation'

    #BOOK CATEGORIES
    get 'kategorieknih', to: 'book_categories#index', as: 'book_categories'
    post 'kategorieknih', to: 'book_categories#create', as: 'add_book_category'
    get 'kategoriaknih/:id/upravit', to: 'book_categories#edit', as: 'edit_book_category'
    patch 'kategoriaknih/:id/upravit', to: 'book_categories#update'
    delete 'kategoriaknih/:id/vymazat', to: 'book_categories#destroy', as: 'delete_book_category'
  end


  #AUTHORS
    get 'autori', to: 'authors#index', as: 'authors'
    get 'autori/admin', to: 'authors#admin', as: 'admin_authors'
    get 'autor/pridat', to: 'authors#new', as: 'new_author'
    post 'autor/pridat', to: 'authors#create', as: 'create_author'
    get 'autor/:id/upravit', to: 'authors#edit', as: 'edit_author'
    patch 'autor/:id/upravit', to: 'authors#update', as: 'update_author'
    delete 'autor/:id/vymazat', to: 'authors#destroy', as: 'delete_author'
    get 'autor/:id', to: 'authors#show', as: 'author'

    get 'api/authors_search', to: 'authors#search', as: 'authors_search'

  #BOOKS
    get 'knihy', to: 'books#index', as: 'books'
    get 'knihy/admin', to: 'books#admin', as: 'admin_books'
    get 'kniha/pridat', to: 'books#new', as: 'new_book'
    post 'kniha/pridat', to: 'books#create', as: 'create_book'
    get 'kniha/:id/upravit', to: 'books#edit', as: 'edit_book'
    patch 'kniha/:id/upravit', to: 'books#update', as: 'update_book'
    delete 'kniha/:id/vymazat', to: 'books#destroy', as: 'delete_book'
    get 'kniha/:id', to: 'books#show', as: 'book'


  #COMMENTS
  get 'komentar', to: 'comments#new'
  post 'komentar/pridat', to: 'comments#create', as: 'create_comment'
  get 'komentar/:id/upravit', to: 'comments#edit', as: 'edit_comment'
  patch 'komentar/:id/upravit', to: 'comments#update', as: 'update_comment'
  delete 'komentar/:id/vymazat', to: 'comments#destroy', as: 'delete_comment'
end
