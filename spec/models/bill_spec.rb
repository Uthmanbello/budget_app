require 'rails_helper'

RSpec.describe Bill, type: :model do
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
      Bill.new(name: 'Food', icon: 'icon', author_id: u1.id)
    end

    it 'should have the correct name' do
      expect(b1.name).to eq('Food')
    end

    it 'should have the correct icon' do
      expect(b1.icon).to eq('icon')
    end

    it 'should have the correct author id' do
      expect(b1.author_id).to eq(u1.id)
    end
  end
end
