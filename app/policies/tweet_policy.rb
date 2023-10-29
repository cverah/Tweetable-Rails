# frozen_string_literal: true

class TweetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def edit?
    # puts "AQUIII EDITTTTT"
    # p user
    # p tweet_user
    (user.present? && user == tweet_user) || user.admin?
  end

  def update?
    (user.present? && user == tweet_user) || user.admin?
  end

  def destroy?
    (user.present? && user == tweet_user) || user.admin?
  end

  def action_tweet?
    # puts "AQUIII ACTIONSS"
    # p user
    # aqui el record tiene el comentario de tweet
    # por llamamrle policy(tweet).action_tweet en el index de users
    # p record
    # p record.user
    user.present? && user == record.user
  end

  private

  def tweet_user
    # p record saca el id del tweet
    # haciendo con asociacion del modelo del tweet se va al user con user
    record.user
  end
end
