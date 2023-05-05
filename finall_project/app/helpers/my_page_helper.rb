# frozen_string_literal: true

# Module for providing helper methods for the MyPage views
module MyPageHelper
  def user_receiver_status(status)
    return unless !status.is_a?(TrueClass) || !status.is_a?(FalseClass)

    UsersReceiver.where(user_id: current_user.id, delete_status: false, users_receivers_delete: status)
  end

  def thankscard_status(status)
    return unless !status.is_a?(TrueClass) || !status.is_a?(FalseClass)

    ThanksCard.where(user_id: current_user.id, delete_status: status)
  end

  def sort_by_update_at(lst, attribute = nil)
    return [] if lst.blank?

    if attribute.present?
      lst.sort_by { |items| (Time.zone.now - items.send(attribute.to_sym).updated_at).to_i }
    else
      lst.sort_by { |items| (Time.zone.now - items.updated_at).to_i }
    end
  end
end
