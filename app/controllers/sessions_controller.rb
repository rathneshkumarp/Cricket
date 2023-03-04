class SessionsController < ApplicationController
  def create
    session = Session.create(token: SecureRandom.hex(13), expire_at: 2.minutes.from_now)
    render json: { token: session.token, expire_at: session.expire_at }
  end
end
