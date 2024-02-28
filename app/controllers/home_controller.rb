class HomeController < ApplicationController
  def index
    @user = User.last
    @exchange_rates = CurrencyConverterService.new.fetch_exchange_rates(@user.base_currency)
  end

  def update_base_currency
    @user = User.last
    if @user.update(user_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:base_currency)
  end
end
