class MyPageController < ApplicationController
    def home
        @thanks_card = ThanksCard.all
    end

    def send_thanks_card
    end

    def send_new_thanks_card
    end
end
