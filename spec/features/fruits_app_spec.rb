require 'spec_helper'
require 'capybara/rspec'

feature "Fruits App" do
  scenario "Welcomes User" do
    visit '/'
    expect(page).to have_content 'Welcome!'
  end
  scenario "Creates Fruits" do
    visit '/'
    click_on 'View Fruits'

    click_on 'Add Fruit'
    fill_in 'name', :with => 'Banana'
    fill_in 'description', :with => 'Yellow'
    click_on 'Add Fruit'

    expect(page).to have_content 'Banana'
  end
end