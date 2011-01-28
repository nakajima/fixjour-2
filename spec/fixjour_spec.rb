require 'spec/spec_helper'

describe "Fixjour Builders" do
  include Fixjour

  it "defines builders" do
    Fixjour do
      define User do |user|
        user.name = "Pat"
      end

      define :article do |article|
        article.user = new_user(:name => "Pat")
      end
      
      define :comment, :class => Article::Comment do |comment|
        comment.article = new_article
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

    # It allows associations
    article = new_article
    article.user.should_not be_nil
    article.user.name.should == "Pat"
    
    # It works with namespaces
    comment = new_comment
  end
end
