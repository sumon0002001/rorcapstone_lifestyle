class VotesController < ApplicationController
  before_action :authorize, only: %i[add_vote]

  def add_vote
    @article = Article.find(params[:article_id])
    current_user.votes.create(article: @article)
    flash.notice = 'Thank you for your voting!!'
    redirect_back(fallback_location: root_path)
  end
end
