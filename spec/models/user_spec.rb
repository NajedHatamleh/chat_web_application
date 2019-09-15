require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: "Anything", email: "Anything@domin.com", password: "Anything") }

  it "is vaild with vaild attributes" do
    expect(subject).to be_valid
  end

  it "is insure username not nil" do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it "is not vaild without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not vaild without password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

end
