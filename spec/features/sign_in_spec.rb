require 'spec_helper'

feature 'user signs in' do


  scenario 'an existing user signs in' do
    sign_up(email: 'joseph@coffeenutcase.com', password: 'iamjoseph', password_confirmation: 'iamjoseph')
    visit 'sign_in'
    fill_in('email', with: 'joseph@coffeenutcase.com')
    fill_in('password', with: 'iamjoseph')
    fill_in('password_confirmation', with: 'iamjoseph')
    click_button('Sign in')
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome joseph@coffeenutcase.com")
  end

end
