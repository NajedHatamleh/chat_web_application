require 'rails_helper'

RSpec.describe Room, type: :model do
  subject { described_class.new(name: "Anything") }

  it "is vaild with vaild attributes" do
    expect(subject).to be_valid
  end

  it "is not vaild without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not vaild with name empty" do
    subject.name = ""
    expect(subject).to_not be_valid
  end

end
