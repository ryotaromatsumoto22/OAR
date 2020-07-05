class ApplicationController < ActionController::Base

	# 新規登録後、マイページへ
    def after_sign_up_path_for(resource)
      user_path(current_user.id)
    end

    # ログイン後、マイページへ
    def after_sign_in_path_for(resource)
      user_path(current_user.id)
    end

    # ログアウト後、topページへ
    def after_sign_out_path_for(resource)
      root_path
    end

end
