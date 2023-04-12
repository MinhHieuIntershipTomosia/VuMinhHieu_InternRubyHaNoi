class MyPageController < ApplicationController
    def home
        @thanks_card = ThanksCard.all
    end

    def send_thanks_card
    end

    def send_new_thanks_card
        # @user = User.where.not(id: current_user.id)
        @users = User.all
        @thankscard = ThanksCard.new
        puts "list user : #{@users.count}"
    end
end
