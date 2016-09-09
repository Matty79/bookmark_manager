require 'spec_helper'

feature 'let a user sign up' do
  scenario 'a user signs up on the /sign_up page' do
    visit '/sign_up'
    fill_in('email', with: 'joseph@coffeenutcase.com')
    fill_in('password', with: 'iamjoseph')
    fill_in('password_confirmation', with: 'iamjoseph')
    click_button('Sign Up')
    expect(page).to have_content('Welcome joseph@coffeenutcase.com')
    expect(User.first.email).to eq('joseph@coffeenutcase.com')
    expect(User.count).to eq(1)
  end

  scenario 'password confirmation' do
    visit '/sign_up'
    fill_in('email', with: 'joseph@coffeenutcase.com')
    fill_in('password', with: 'iamjoseph')
    fill_in('password_confirmation', with: 'iamben')
    click_button('Sign Up')
    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
    expect(page).to have_content("Passwords do not match")
  end

  scenario 'user can not sign up with a blank email address' do
    visit '/sign_up'
    fill_in('email', with: '')
    fill_in('password', with: 'asdf')
    fill_in('password_confirmation', with: 'asdf')
    click_button('Sign Up')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end
end
