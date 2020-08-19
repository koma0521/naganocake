class Public::EndUsersController < ApplicationController
    def show
        @end_user = EndUser.find(current_end_user.id)
    end

    def edit
    end

    def update
    end
end
