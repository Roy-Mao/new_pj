class OneTimePasswordsController < ApplicationController
  before_action :set_one_time_password, only: %i[ show edit update destroy ]

  # POST /one_time_passwords or /one_time_passwords.json
  def create
    res = TokenFetcher.new(params[:phone_number]).fetch_token
    flash[:success] = "one time password sended!" if res.success?
  rescue StandardError => e
    flash[:error] = e.messages
  end
end
