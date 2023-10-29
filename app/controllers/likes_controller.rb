class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes
  def index
    @likes = Like.all
    # puts "ingreso a indexxxx"
  end

  # GET /likes/1
  def show
    # puts "ingreso a showww"
  end

  # GET /likes/new
  def new
    # puts "ingreso a newwwwwww"
    @like = Like.new
    
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  def create
    # puts "ingreso a createeeeeee"
    # @like = Like.new(like_params)
    # puts "holaaaaaaaaaaaaaaaa"
    # # @tweet = tweet
    # # p @tweet
    # p current_user
    # @like = Like.new
    # @like.user = current_user
    # @like.tweet = @tweet

    # if @like.save
    #   p "ingreso a saveeee"
    #   redirect_to root_path, notice: "Like was successfully created."
    # else
    #   p "ingreso a elseeeeee"
    #   render :new, status: :unprocessable_entity
    # end
  end

  def like_dislike
    puts "holaaaaaaaaaaaaaaaa"
    @tweet = Tweet.find(params[:tweet_id])
    p @tweet
    p current_user
    @like = Like.new
    @like.user = current_user
    @like.tweet = @tweet

    
    if @like.save
      p "ingreso a saveeee"
      redirect_to root_path, notice: "Like was successfully created."
    else
      p "ingreso a elseeeeee"
      Like.destroy_by(user: current_user, tweet: @tweet)
      redirect_to root_path, notice: "Like was successfully destroyed."
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      redirect_to likes_url, notice: "Like was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
    redirect_to likes_url, notice: "Like was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:tweet_id)
    end
end
