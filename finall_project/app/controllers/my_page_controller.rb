class MyPageController < ApplicationController
    def home
        @thanks_card = ThanksCard.all
    end
end
