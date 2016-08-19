class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @forum = Forum.find(params[:forum_id])
    @comments = @forum.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @forum = Forum.find(params[:forum_id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @forum = Forum.find(params[:forum_id])
  end

  # GET /comments/1/edit
  def edit
    @forum = Forum.find(params[:forum_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    @forum = Forum.find(params[:forum_id])
    @comment.forum = @forum

    #@comment = current_user.comments.new(comment_params)
    #@comment.forum = @forum
    respond_to do |format|
      if @comment.save
        format.html { redirect_to forum_path(@forum), notice: 'Comentario creado exitosamente.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @forum = Forum.find(params[:forum_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to forum_comments_path(@forum), notice: 'Comentario actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    @forum = Forum.find(params[:forum_id])
    respond_to do |format|
      format.html { redirect_to forum_path(@forum), notice: 'Comentario eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :forum_topic, :user_id)
    end
end
