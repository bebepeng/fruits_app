require 'spec_helper'
require 'capybara/rspec'

feature "Fruits App" do
  scenario "Welcomes User" do
    visit '/'
    expect(page).to have_content 'Welcome!'
  end
  scenario "Users can create fruits" do
    visit '/'
    click_on 'View Fruits'

    click_on 'Add Fruit'
    fill_in 'name', :with => 'Banana'
    fill_in 'description', :with => 'Yellow and Crescent Shaped'
    click_on 'Add Fruit'

    expect(page).to have_content 'Banana'
  end
  scenario "Users can view a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'name', :with => 'Apple'
    fill_in 'description', :with => 'Red and Round'
    click_on 'Add Fruit'

    click_on 'View Details'

    expect(page).to have_content 'Apple'
    expect(page).to have_content 'Red and Round'
  end
  scenario "Users can edit a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'name', :with => 'Apple'
    fill_in 'description', :with => 'Red and Shiny'
    click_on 'Add Fruit'

    click_on 'View Details'

    click_on 'Edit Details'
    fill_in 'description', :with => 'Red and Round'
    click_on 'Update Details'

    expect(page).to have_content 'Red and Round'
  end
  scenario "Users can edit a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'name', :with => 'Apple'
    fill_in 'description', :with => 'Red and Shiny'
    click_on 'Add Fruit'

    click_on 'View Details'
    click_on 'Delete Fruit'

    expect(page).to_not have_content 'Apple'
  end
end