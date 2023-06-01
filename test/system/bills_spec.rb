require 'rails_helper'

RSpec.describe Bill, type: :system do
  describe 'Bill index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'uthman',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111')
    end
    let(:b1) do
      Bill.new(name: 'Food', icon: 'food', author_id: u1.id)
    end

    let(:i1) do
      Item.new(name: 'Rice', amount: 1, author_id: u1.id, bill_id: b1.id)
    end

    before(:each) do
      b1.save
      i1.save
    end
    before(:each) do
      visit '/bills'
    end

    it 'Logs in with valid data' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log In')
      sleep 2
    end
    it 'should have the correct name' do
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log In')

      expect(page).to have_content('Food')
      sleep 1
      click_link('Food')
      expect(page).to have_content('Rice')
      expect(page).to have_content('1.0')
    end
  end
end
