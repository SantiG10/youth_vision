class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /forums
  # GET /forums.json
  def index
    @option = params[:option]
    if @option.present?
      @forums = Forum.where(forum_type: @option )
    end
  end

  def forum_life
    @forums = Forum.where(forum_type: 0)
  end

  def forum_endeavor
    @forums = Forum.where(forum_type: 1)
  end

  def forum_professional
    @forums = Forum.where(forum_type: 2)
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @comment = Comment.new
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    ##@forum = Forum.new(forum_params)
    @forum = current_user.forums.new(forum_params)
    respond_to do |format|
      if @forum.save
        format.html { redirect_to forum_path(@forum), notice: 'Foro creado exitosamente.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Foro actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Foro eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:title, :description, :forum_type)
    end
end
