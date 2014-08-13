require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'First name', with: 'Ted'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'ted@smith.com'
    fill_in 'Password', with: 'sup3rskrit'
    fill_in 'Password confirmation', with: 'sup3rskrit'


    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Ted')
    expect(page).to have_text('Signed in as ted@smith.com')
  end

  scenario 'allows existing users to login' do
    User.create(
      first_name: 'bob',
      last_name: 'smith',
      email: 'bob@example.com',
      password: 'sup3rs3krit',
      password_confirmation: 'sup3rs3krit'
    )
    visit '/'

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'sup3rs3krit'

    click_button 'Login'
    expect(page).to have_text('Welcome back Bob')
    expect(page).to have_text('Signed in as bob@example.com')
  end
end
