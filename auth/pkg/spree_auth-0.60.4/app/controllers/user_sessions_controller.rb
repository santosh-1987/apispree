class UserSessionsController < Devise::SessionsController
  include SpreeBase
  helper :users, 'spree/base'

  include Spree::CurrentOrder

  after_filter :associate_user, :only => :create

  ssl_required :new, :create, :destroy, :update
  ssl_allowed :login_bar

  # GET /resource/sign_in
  def new
    super
  end
  def create
    authenticate_user!

    if user_signed_in?
      api_key = current_user.generate_api_key!
      user_response = Hash.new
      user_response[:user] = Hash.new
      user_response[:user][:email]=current_user.email
      user_response[:user][:authentication_token]=current_user.authentication_token
      user_response[:user][:sign_in_count]=current_user.sign_in_count
      respond_to do |format|
        format.html {
          flash.notice = t(:logged_in_succesfully)
          redirect_back_or_default(products_path)
        }
        format.json {
          render :json => user_response.to_json
        }
      end
    else
      flash.now[:error] = t('devise.failure.invalid')
      render :new
    end
  end
  #~ def create
    #~ authenticate_user!

    #~ if user_signed_in?
      #~ respond_to do |format|
        #~ format.html {
          #~ flash[:notice] = I18n.t("logged_in_succesfully")
          #~ redirect_back_or_default(products_path)
        #~ }
        #~ format.js {
          #~ user = resource.record
          #~ render :json => {:ship_address => user.ship_address, :bill_address => user.bill_address}.to_json
        #~ }
      #~ end
    #~ else
      #~ flash[:error] = I18n.t("devise.failure.invalid")
      #~ render :new
    #~ end
  #~ end

  def destroy
    session.clear
    super
  end

  def nav_bar
    render :partial => "shared/nav_bar"
  end

  private

  def associate_user
    return unless current_user and current_order
    current_order.associate_user!(current_user)
    session[:guest_token] = nil
  end

  def accurate_title
    I18n.t(:log_in)
  end

end
