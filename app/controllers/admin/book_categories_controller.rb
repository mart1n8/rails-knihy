class Admin::BookCategoriesController < ApplicationController
    before_action :set_book_category, only: [:edit, :update, :destroy]
    before_action :is_not_super_user_redirect

    def index
        @book_category ||= BookCategory.new 
        list_book_categories    
    end

    # POST /admin/kategorieknih
    # POST /admin/kategorieknih.json
    def create
        @book_category = BookCategory.new(book_category_params)
        respond_to do |format|
        if @book_category.save
            flash[:notice] = "Kategória kníh \"#{@book_category.title}\" bola pridaná.".html_safe 
            format.html { redirect_back(fallback_location: admin_book_categories_path) }
            format.json { render :show, status: :created, location: @book_category }
        else
            list_book_categories
            format.html { render :index }
            format.json { render json: @book_category.errors, status: :unprocessable_entity }
        end
        end
    end


    # GET /nation/1/edit
    def edit
    end

    # PATCH/PUT /nation/1
    # PATCH/PUT /nation/1.json
    def update
        respond_to do |format|
        if @book_category.update(book_category_params)
            flash[:notice] = "Kategória kníh \"#{@book_category.title}\" bola upravená.".html_safe 
            format.html { redirect_to admin_edit_book_category_path(@book_category) }
            format.json { render :show, status: :ok, location: @book_category }
        else
            format.html { render :edit }
            format.json { render json: @book_category.errors, status: :unprocessable_entity }
        end
        end
    end

    # GET /nation/1/edit
    def destroy
        @book_category.destroy
        flash[:notice] = "Kategória kníh \"#{@book_category.title}\" bola vymazaná.".html_safe
        redirect_back(fallback_location: admin_book_categories_path)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_category
      @book_category = BookCategory.friendly.find(params[:id])
    end

    def list_book_categories
        @book_categories = BookCategory.order(title: :asc).all
    end

    # Only allow a list of trusted parameters through.
    def book_category_params
      params.require(:book_category).permit(:title)
    end
end
