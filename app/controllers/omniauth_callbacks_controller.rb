class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      session[:user_id] = user.id
      sign_in_and_redirect user, notice: 'Signed in!'
    else
      # Devise allow us to save the attributes eventhough
      # we havent create the user account yet
      session['devise.user_attributes'] = user.attributes
      # need domen to twitter app (Privacy Policy URL)
      # for development:
      redirect_to new_user_registration_url(:callback => 'twitter')
    end
  end

  alias twitter all
  alias github all
  alias google_oauth2 all
end
