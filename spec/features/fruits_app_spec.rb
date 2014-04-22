require 'spec_helper'
require 'capybara/rspec'

feature "Fruits App" do
  scenario "Welcomes User" do
    visit '/'
    expect(page).to have_content 'Welcome!'
  end
end