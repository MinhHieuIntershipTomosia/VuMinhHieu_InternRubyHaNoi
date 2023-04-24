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

  def get_top_one_send
    if ThanksCard.all.count > 0
      lst_thankscard = ThanksCard.where(delete_status: false)
      get_top_one(lst_thankscard)
    end
  end

  def get_top_one_receiver
    if UsersReceiver.all.count > 0
      lst_user_receiver = UsersReceiver.where(delete_status: false, users_receivers_delete: false)
      get_top_one(lst_user_receiver)
    end
  end

  def get_top_one(lst)
    if !lst.nil?
      hash_count = Hash.new(0)
      lst.each do |items|
        hash_count[items.user_id] += 1
      end

      sort_count = hash_count.sort_by { |k, v| v }

      max_value = sort_count.last[1]

      lst_max_value = sort_count.select { |k, v| v == max_value }
      @lst_user = lst_max_value.map { |k, v| User.find(k) }
    end
  end

  def edit_image
    if !params[:thanks_card][:edit].nil?
      arr = params[:thanks_card][:edit].split(",")
      arr.each_with_index do |items, index|
        @image = @thankscard.image.find(items.to_i)
        @image.purge
        @thankscard.image.attach(params[:thanks_card][:image][index + 1])
      end
    end
  end
end
