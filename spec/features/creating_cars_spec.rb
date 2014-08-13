require "rails_helper"

feature "Creating Cars" do
  scenario "can create a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    within('table#cars') do
      expect(page).to have_content('$2,300.00')
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
    end
  end
  scenario 'adding a 2nd car' do
    car = Car.create(
      make: 'Ford',
      model: 'Mustang',
      year: '1967',
      price: '2300.0'
    )
    visit '/'
    # save_and_open_page

    click_link 'New Car'

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Highlander'
    fill_in 'Year', with: '2005'
    fill_in 'Price', with: '12000'

    click_button 'Create Car'

    expect(page).to have_content('2005 Toyota Highlander created')
    # save_and_open_page
    within('table#cars') do
      expect(page).to have_content(car.make)
      expect(page).to have_content(car.model)
      expect(page).to have_content(car.year)
      expect(page).to have_content('$2,300.00')

      expect(page).to have_content('Toyota')
      expect(page).to have_content('Highlander')
      expect(page).to have_content('2005')
      expect(page).to have_content('$12,000.00')
    end
  end

  scenario 'editing an existing car' do
    car = Car.create(
      make: 'Ford',
      model: 'Mustang',
      year: '1967',
      price: '2300.0'
    )
    visit '/'

    click_link 'Edit'

    fill_in 'Price', with: '2100.0'

    click_button 'Update Car'
    expect(page).to have_content('1967 Ford Mustang updated')
    within('table#cars') do
      expect(page).to have_content('$2,100.00')
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
    end
  end

  # scenario 'deleting an existing car' do
  #   car = Car.create(
  #     make: 'Ford',
  #     model: 'Mustang',
  #     year: '1967',
  #     price: '2300.0'
  #   )
  #   visit '/'
  #   # save_and_open_page
  #   click_link 'Delete'
  # end
end
