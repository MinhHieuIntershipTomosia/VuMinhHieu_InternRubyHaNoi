# frozen_string_literal: true

# The ThanksCardHelper module contains methods displayed thankscard.
module ThanksCardHelper
  # anho anho
  def test_lst_userreceiver
    return unless params[:thanks_card][:user_receiver_id].present?

    flash[:danger] = 'No has User receiver'
    redirect_to sendnew_url
  end

  def lst_name_userreceiver(thanks_card)
    return unless thanks_card

    users_receiver = thanks_card.users_receiver
    user_receiver_names = users_receiver.map { |item| item.user.full_name }
    user_receiver_names.join(', ')
  end

  def top_one_send
    return unless ThanksCard.all.count.negative?

    lst_thankscard = ThanksCard.where(delete_status: false)
    top_one(lst_thankscard)
  end

  def top_one_receiver
    lst_user_receiver = UsersReceiver.where(delete_status: false, users_receivers_delete: false)
    return UsersReceiver.all.count.negative? unless lst_user_receiver.exists?

    top_one(lst_user_receiver)
  end

  def top_one(lst)
    return if lst.nil?

    hash_count = Hash.new(0)
    lst.each do |items|
      hash_count[items.user_id] += 1
    end

    sort_count = hash_count.sort_by { |_k, v| v }

    max_value = sort_count.last[1]

    lst_max_value = sort_count.select { |_k, v| v == max_value }
    @lst_user = lst_max_value.map { |k, _v| User.find(k) }
  end

  def edit_image
    return unless params.dig(:thanks_card, :edit).present?

    image_ids = params[:thanks_card][:edit].split(', ')
    image_params = params[:thanks_card][:image]
    update_images(image_ids, image_params)
  end

  def update_images(ids, params)
    ids.each_with_index do |id, index|
      image = @thankscard.image.find(id.to_i)
      image.purge
      image.attach(params[index + 1])
    end
  end
end
