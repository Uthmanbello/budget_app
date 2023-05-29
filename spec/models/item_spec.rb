require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Item index' do
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

    let(:i1) do
      Item.new(name: 'Rice', amount: 1, author_id: u1.id, bill_id: b1.id)
    end

    it 'should have the correct name' do
      expect(i1.name).to eq('Rice')
    end

    it 'should have the correct amount' do
      expect(i1.amount).to eq(1)
    end

    it 'should have the correct author id' do
      expect(i1.author_id).to eq(u1.id)
    end

    it 'should have the correct bill id' do
      expect(i1.bill_id).to eq(b1.id)
    end
  end
end
