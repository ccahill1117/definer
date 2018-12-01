require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the definer app', {:type => :feature}) do
  it('adds a new vocabulary word') do
    visit('/')
    fill_in('word', :with => 'ambiguous')
    fill_in('def', :with => 'unclear in meaning')
    click_button('Add Word to Library!')
    expect(page).to have_content('ambiguous')
  end
end
