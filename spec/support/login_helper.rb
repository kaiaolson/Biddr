module LoginHelpers
  def login(user)
    request.session[:user_id] = user.id
  end

  def login_via_web(user)
    visit new_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end
