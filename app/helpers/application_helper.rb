module ApplicationHelper
  def number_to_currency_br(number)
    number_to_currency(number, unit: 'B$ ', separator: ',', delimiter: ',', format: '%n %u')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def is_highest_authority?
    @current_user.position == 'gorosei'
  end
end
