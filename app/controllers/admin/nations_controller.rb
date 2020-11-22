class Admin::NationsController < ApplicationController
    before_action :set_nation, only: [:edit, :update, :destroy]
    before_action :is_not_super_user_redirect

    def index
        @nation ||= Nation.new 
        list_nations    
    end

    # POST /admin/nations
    # POST /admin/nations.json
    def create
        @nation = Nation.new(nation_params)
        respond_to do |format|
        if @nation.save
            flash[:notice] = "Národnosť \"#{@nation.title}\" bola pridaná.".html_safe 
            format.html { redirect_back(fallback_location: admin_nations_path) }
            format.json { render :show, status: :created, location: @nation }
        else
            list_nations
            format.html { render :index }
            format.json { render json: @nation.errors, status: :unprocessable_entity }
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
        if @nation.update(nation_params)
            flash[:notice] = "Národnosť \"#{@nation.title}\" bola upravená.".html_safe 
            format.html { redirect_to admin_edit_nation_path(@nation) }
            format.json { render :show, status: :ok, location: @nation }
        else
            format.html { render :edit }
            format.json { render json: @ad_category.errors, status: :unprocessable_entity }
        end
        end
    end

    # GET /nation/1/edit
    def destroy
        @nation.destroy
        flash[:notice] = "Národnosť \"#{@nation.title}\" bola vymazaná.".html_safe
        redirect_back(fallback_location: admin_nations_path)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_nation
      @nation = Nation.friendly.find(params[:id])
    end

    def list_nations
        @nations = Nation.paginate(page: params[:page], per_page: 30)
    end

    # Only allow a list of trusted parameters through.
    def nation_params
      params.require(:nation).permit(:title, :slug, :flag)
    end
end
