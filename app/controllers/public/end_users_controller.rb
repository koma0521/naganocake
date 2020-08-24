class Public::EndUsersController < ApplicationController
    before_action :authenticate_end_user!
    def show
        @end_user = EndUser.find(current_end_user.id)
    end

    def edit
        @end_user = EndUser.find(params[:id])
    end

    def update
        end_user = EndUser.find(params[:id])
        end_user.update(end_user_params)
        redirect_to end_user_path(end_user)
    end

    def unsubscribe
    end

    def withdraw
        end_user = EndUser.find(current_end_user.id)
        end_user.update(is_deleted: "退会済み")
        redirect_to root_path
    end

    private
        def end_user_params
            params.require(:end_user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:telephone_code,:address,:email)
        end
end
