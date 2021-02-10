require 'rails_helper'

RSpec.describe 'Creating a category', type: :feature do
  let!(:user) { User.create(name: 'test') }

  scenario 'create with valid attributes', js: true do
    visit '/login'
    fill_in 'name', with: 'test'
    click_button('Sign In')
    visit new_category_path
    fill_in 'category_name', with: 'Anything'
    fill_in 'category_priority', with: '1'
    click_button('Create category')
    expect(page).to have_content('Category created!')
  end
end
