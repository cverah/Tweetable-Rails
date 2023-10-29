# frozen_string_literal: true

class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  def show; end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    authorize @tweet
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    ruta = if @tweet.replied_to_id.nil?
             root_path
           else
             tweet_path(@tweet.replied_to_id)
           end
    if @tweet.save
      redirect_to ruta, notice: 'Tweet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    authorize @tweet
    ruta = if @tweet.replied_to_id.nil?
             root_path
           else
             tweet_path(@tweet.replied_to_id)
           end
    if @tweet.update(tweet_params)
      redirect_to ruta, notice: 'Tweet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    authorize @tweet
    @tweet.destroy
    redirect_to root_path, notice: 'Tweet was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:body, :replied_to_id)
  end
end
