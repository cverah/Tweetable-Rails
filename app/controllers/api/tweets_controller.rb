class Api::TweetsController < ApiController
  def index
    @tweets = Tweet.all
    render json: @tweets, status: :ok
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user = current_user
    if tweet.save
      render json: tweet, status: :created
    else
      p tweet.errors.full_messages
      render json: { errors: tweet.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body, :replied_to_id)
  end
end