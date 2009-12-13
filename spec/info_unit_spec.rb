require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "InfoUnit" do
  
  describe "#new" do

    it "100 KB" do
      [
        InfoUnit.new(100, 'KB'),
        InfoUnit.new('100KB'),
        InfoUnit.new('100 KB'),
      ].each do |x|
        x.number.should == 100
        x.unit.should == 'KB'
        x.bytes.should == 100 * 1024
        x.to_hash.should == { 'KB' => 100 }
      end
    end
  
    it "27 MB" do
      [
        InfoUnit.new(27, 'MB'),
        InfoUnit.new('27MB'),
        InfoUnit.new('27 MB'),
      ].each do |x|
        x.number.should == 27
        x.unit.should == 'MB'
        x.bytes.should == 27 * 1048576
        x.to_hash.should == { 'MB' => 27 }
      end
    end

    it "2.3 MB" do
      [
        InfoUnit.new(2.3, 'MB'),
        InfoUnit.new('2.3MB'),
        InfoUnit.new('2.3 MB'),
      ].each do |x|
        x.number.should == 2.3
        x.unit.should == 'MB'
        x.bytes.should == 2.3 * 1048576
        x.to_hash.should == { 'MB' => 2.3 }
      end
    end

    it "1.01 KB" do
      [
        InfoUnit.new(1.01, 'KB'),
        InfoUnit.new('1.01KB'),
        InfoUnit.new('1.01 KB'),
      ].each do |x|
        x.number.should == 1.01
        x.unit.should == 'KB'
        x.bytes.should == 1.01 * 1024
        x.to_hash.should == { 'KB' => 1.01 }
      end
    end

    it "45" do
      x = InfoUnit.new('45')
      x.number.should == nil
      x.unit.should == nil
      x.bytes.should == nil
      x.to_hash.should == {}
    end

    it "45 sheep" do
      x = InfoUnit.new('45 sheep')
      x.number.should == nil
      x.unit.should == nil
      x.bytes.should == nil
      x.to_hash.should == {}
    end
  
  end

end
