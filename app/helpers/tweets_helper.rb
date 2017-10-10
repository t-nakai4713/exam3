module TweetsHelper
  def choose_new_or_edit
#    if action_name == 'new' || action_name == 'confirm'
    if action_name == 'edit'
      tweet_path
    else
      confirm_tweets_path
    end
  end
end
