class HomeController < ApplicationController

    skip_before_action :authenticate_staff_member!, only: [:index]  # ユーザー認証が不要な場合
      
    def index
    end

end
