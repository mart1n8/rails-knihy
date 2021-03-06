require 'json'

class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :search, :show]

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.paginate(page: params[:page], per_page: 20)
  end
  def admin
    @authors = Author.includes(:nation).paginate(page: params[:page], per_page: 30)
  end

  def search
    return false if !params[:phrase].presence or params[:phrase].blank?
    @authors = Author.search(params[:phrase])
    render json: @authors 
  end


  # GET /authors/1
  # GET /authors/1.json
  def show
    @author = Author.includes(:comments).friendly.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)
    @author.user_id = current_user.id
    respond_to do |format|
      if @author.save
        flash[:notice] = "Autor #{@author.full_name} bol pridaný."
        format.html { redirect_to @author }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        flash[:notice] = "Autor #{@author.full_name} bol upravený."
        format.html { redirect_to edit_author_path(@author) }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.books.delete_all
    
    @author.destroy
    respond_to do |format|
      flash[:error] = "Autor #{@author.full_name} bol odstránený."
      format.html { redirect_to authors_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :nation_id, :birth_day, :death_day, :birth_place, :death_place, :photo)
    end
end
