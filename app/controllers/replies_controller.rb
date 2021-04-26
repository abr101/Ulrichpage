class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]
  skip_before_action :authenticate, only: [:index]

  # GET /replies or /replies.json
  def index
    @reply_ad = true if params[:reply].present?
    @post_ad = PostAd.find_by(id: params[:id])
    @replies = @post_ad.replies
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @post_ad =  PostAd.find_by(id: params[:id])
    @reply = Reply.new(post_ad: @post_ad, user: current_user)
  end

  # GET /replies/1/edit
  def edit
    if @reply.user == current_user
    else
      redirect_to replies_path(id: @reply.post_ad.id), alert:"Access denied, This action can be performed by creator or admin!"
    end
  end

  # POST /replies or /replies.json
  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to replies_path(id: @reply.post_ad.id), notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)

        format.html { redirect_to replies_path(id: @reply.post_ad.id), notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    if @reply.user == current_user
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
    else
      redirect_to replies_path(id: @reply.post_ad.id), alert:"Access denied, This action can be performed by creator or admin!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:text, :user_id, :post_ad_id)
    end
end
