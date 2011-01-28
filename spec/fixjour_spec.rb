require 'spec/spec_helper'

describe "Fixjour Builders" do
  include Fixjour

  it "defines builders" do
    Fixjour do
      define User do |user|
        user.name = "Pat"
      end
    end

    user = new_user
    user.new_record?.should be_true
    user.should be_kind_of(User)
    user.name.should == "Pat"

    # Allow overrides
    user = new_user(:name => "Brandon")
    user.name.should == "Brandon"

    # Define create_ method
    user = create_user
    user.new_record?.should be_false
    user.should be_kind_of(User)
    
    # It also allows overrides
    user = create_user(:name => "Brandon", :age => 25)
    user.new_record?.should be_false
    user.name.should == "Brandon"
    user.age.should == 25
  end
end
