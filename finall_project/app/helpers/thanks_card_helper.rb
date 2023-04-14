module ThanksCardHelper
  def test_lst_userreceiver
    if (params[:thanks_card][:user_receiver_id].nil? || params[:thanks_card][:user_receiver_id].empty?)
      flash[:danger] = "No has User receiver"
      redirect_to sendnew_url
    end
  end

  def lst_name_userreceiver(thanks_card)
    if !thanks_card.nil?
      users_receiver = thanks_card.users_receiver
      user_receiver_names = users_receiver.map { |item| item.user.full_name }
      users_receiver_string = user_receiver_names.join(", ")
    end
  end
end
