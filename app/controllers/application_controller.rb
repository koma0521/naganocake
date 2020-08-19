class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when EndUser
          mypage_path # ログイン後に遷移するpathを設定
        when Admin
          admin_items_path
        end
    end

    def after_log_out_path_for(resource)
        root_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number])
    end
end
