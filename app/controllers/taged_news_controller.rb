class TagedNewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_taged_news, only: [:show, :edit, :update, :destroy]

  # GET /taged_news
  # GET /taged_news.json
  def index
    redirect_to news_chooser_path
  end

  # GET /taged_news/1
  # GET /taged_news/1.json
  def show
    redirect_to news_chooser_path
  end

  # GET /taged_news/new
  def new
    @taged_news = current_user.taged_news.build
  end

  # GET /taged_news/1/edit
  def edit
  end

  # POST /taged_news
  # POST /taged_news.json
  def create
    @taged_news = current_user.taged_news.build(taged_news_params)
    respond_to do |format|
      if @taged_news.save
        format.html { redirect_to @taged_news, notice: 'Taged news was successfully created.' }
        format.json { render :show, status: :created, location: @taged_news }
      else
        format.html { render :new }
        format.json { render json: @taged_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taged_news/1
  # PATCH/PUT /taged_news/1.json
  def update
    respond_to do |format|
      if @taged_news.update(taged_news_params)
        format.html { redirect_to @taged_news, notice: 'Taged news was successfully updated.' }
        format.json { render :show, status: :ok, location: @taged_news }
      else
        format.html { render :edit }
        format.json { render json: @taged_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taged_news/1
  # DELETE /taged_news/1.json
  def destroy
    @taged_news.destroy
    respond_to do |format|
      format.html { redirect_to taged_news_index_url, notice: 'Taged news was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taged_news
      @taged_news = TagedNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taged_news_params
      params.require(:taged_news).permit(:tag)
    end
end
