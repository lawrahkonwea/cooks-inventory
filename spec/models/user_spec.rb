require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Laura', email: 'laura@gmail.com', password: '1234567890')
  end
  before { subject.save }

  it 'email should not be empty' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should be implemented' do
    expect(subject.name).to eql 'Laura'
  end

  it 'email should be implemenged' do
    expect(subject.email).to eql 'laura@gmail.com'
  end
end
