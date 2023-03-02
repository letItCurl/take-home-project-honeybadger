class Api::V1::Webhooks::SlackController < ApplicationController
  before_action :check_params

  def alert
    text = "Description: #{params["Description"]}\nEmail: #{params["Email"]}\nFrom: #{params["From"]}\n"

    res = HTTParty.post(Rails.application.credentials.dig(:slack, :url), body: { text: text }.to_json, headers: { 'Content-Type' => 'application/json' })
    if res.success?
      render json: { message: "Success!" }, status: 200
    else
      render json: { message: "An error occured." }, status: 422
    end
  end

  private
    def check_params
      if params["Type"].blank?
        render json: { errors: ["Type key is empty."] }, status: 422 and return
      end

      if params["Type"] != "SpamNotification"
        render json: { errors: ["Only forward payloads to Slack that have a 'Type' of 'SpamNotification'."] }, status: 422 and return
      end
    end
end
