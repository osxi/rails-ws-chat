require "test_helper"

class MessagesFeaturesTest < Capybara::Rails::TestCase
  describe 'Messages Features', :capybara do
    before(:each) { visit root_path }

    it 'shows the title' do
      assert page.has_content?("Messages")
    end

    it 'can create messages' do
      skip 'need fix for ws connection in tests; use js: true'
      body = 'A new message.'
      fill_in 'Enter a message', with: body
      find(:xpath, "//input[@type='submit']").click
      assert_equal body, Message.last.body
    end
  end
end
