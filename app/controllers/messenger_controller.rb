class MessengerController < Messenger::MessengerController
  def webhook
    #logic here
    render nothing: true, status: 200
  end
end


### Here it would start
require 'rest-client'

module Messenger
  class MessengerController < ActionController::Base
    def validate
      if verify_token_valid? && access_token_valid?
        render json: params["hub.challenge"]
      elsif !verify_token_valid?
        render json: 'Invalid verify token'
      else
        render json: 'Invalid page access token'
      end
    end

    def subscribe
      render json: activate_bot
    rescue RestClient::BadRequest
      render json: 'Invalid page access token'
    end

    private

    def app_location
      "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=#{Messenger.config.page_access_token}"
    end

    def activate_bot
      RestClient.post(app_location, nil)
    end

    def access_token_valid?
      JSON.parse(RestClient.get(app_location)).key?('data')
    rescue RestClient::BadRequest
      return false
    end

    def verify_token_valid?
      params["hub.verify_token"] == Messenger.config.verify_token
    end

    def fb_params
      Params.new(params)
    end
  end
end