class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = Comment.all
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.create(content: params[:content], user_id: 12, gossip_id: @gossip.id)

  end




  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :gossip_id)
    end
end