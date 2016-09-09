
  def add_link_no_submit
    visit '/links/new'
    fill_in('title', with: 'Codecademy')
    fill_in('url', with: 'www.codecademy.com')
  end

  def sign_up(email: email, password: password, password_confirmation: password_confirmation)
    visit '/sign_up'
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button('Sign Up')
  end
