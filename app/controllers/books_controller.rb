class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :search, :show]


  # GET /books
  # GET /books.json
  def index
    @books = Book.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end
  
  # GET /books
  # GET /books.json
  def admin
    @books = Book.includes(:authors).paginate(page: params[:page], per_page: 30)
  end
  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @book_categories = BookCategory.order(title: :asc).all
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        flash[:notice] = "Knižka bola pridaná."
        format.html { redirect_to @book }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        flash[:notice] = "Knižka bola upravená."
        format.html { redirect_to @book }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      flash[:notice] = "Knižka bola vymazaná."
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.includes(:authors).friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :original_name, :slug, :cover_img, :publish_year, :about, :author_ids => [], :book_category_ids => [])
    end
end
