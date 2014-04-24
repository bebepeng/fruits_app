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
    fill_in 'fruit_name', :with => 'Banana'
    fill_in 'fruit_description', :with => 'Yellow and Crescent Shaped'
    click_on 'Create Fruit'

    expect(page).to have_content 'Banana'
  end
  scenario "Users can view a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'fruit_name', :with => 'Apple'
    fill_in 'fruit_description', :with => 'Red and Round'
    click_on 'Create Fruit'

    click_on 'View Details'

    expect(page).to have_content 'Apple'
    expect(page).to have_content 'Red and Round'
  end
  scenario "Users can edit a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'fruit_name', :with => 'Apple'
    fill_in 'fruit_description', :with => 'Red and Shiny'
    click_on 'Create Fruit'

    click_on 'View Details'

    click_on 'Edit Details'
    fill_in 'fruit_description', :with => 'Red and Round'
    click_on 'Update Fruit'

    expect(page).to have_content 'Red and Round'
  end
  scenario "Users can edit a specific fruit" do
    visit '/fruits'
    click_on 'Add Fruit'
    fill_in 'fruit_name', :with => 'Apple'
    fill_in 'fruit_description', :with => 'Red and Shiny'
    click_on 'Create Fruit'

    click_on 'View Details'
    click_on 'Delete Fruit'

    expect(page).to_not have_content 'Apple'
  end
end