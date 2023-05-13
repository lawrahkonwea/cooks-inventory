require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject do
    Inventory.new(name: 'My First Inventory', user_id: 1)
  end

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should not be empty' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'name should be implemented' do
    expect(subject.name).to eql 'My First Inventory'
  end

  it 'user should be implemenged' do
    expect(subject.user_id).to eql 1
  end
end
