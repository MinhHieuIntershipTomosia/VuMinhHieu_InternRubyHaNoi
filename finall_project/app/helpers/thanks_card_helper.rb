module ThanksCardHelper
  def test_lst_userreceiver
    if (params[:thanks_card][:user_receiver_id].nil? || params[:thanks_card][:user_receiver_id].empty?)
      flash[:danger] = "No has User receiver"
      redirect_to sendnew_url
    end
  end
end
