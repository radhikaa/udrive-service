class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: [:create]

  def create
    user_params = {full_name: params[:full_name], age: params[:age].to_i, sex: params[:sex], email: params[:email], password: params[:password]}
    license = params[:license]
    user = User.new(user_params)
    user.save
    user.save_license(license)
    render json: {status: :ok}
  end

  def index
    render json: User.all
  end
end