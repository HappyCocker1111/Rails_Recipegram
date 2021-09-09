class ApplicationController < ActionController::Base
    #ユーザーページに行く前に行う
    before_action :configure_permitted_parameters, if: :devise_controller?

    #このクラスでのみ使う
    private

    #sign_upの時にusernameを独自パラメーターとして追加で登録するようにストロングパラメーターを追加する
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
