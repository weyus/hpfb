require 'spec_helper'

describe Provider do
  it "should generate a new ProviderDisplay object upon creation" do
    ProviderDisplay.count.should == 0
    FileUtils.rm(Dir.glob("#{ProviderDisplay.display_scss_dir}/*.scss"))
    Dir.glob("#{ProviderDisplay.display_scss_dir}/*.scss").size.should == 0
    File.new(ProviderDisplay.default_display_scss, "w")
    Dir.glob("#{ProviderDisplay.display_scss_dir}/*.scss").size.should == 1

    provider = FactoryGirl.create(:provider)

    ProviderDisplay.count.should == 1
    ProviderDisplay.first.provider.should == provider
    File.new(ProviderDisplay.first.scss_filename).should_not be_nil
    Dir.glob("#{ProviderDisplay.display_scss_dir}/*.scss").size.should == 2
  end
end

# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

