require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "InfoUnit" do
  
  describe "#new" do

    it "100 KB" do
      [
        InfoUnit.new(100, 'KB'),
        InfoUnit.new('100KB'),
        InfoUnit.new('100 KB'),
      ].each do |x|
        bytes = 100 * 1024
        x.number.should == 100
        x.unit.should == 'KB'
        x.bytes.should == bytes
        x.to_hash.should == {
          'number' => 100,
          'unit'   => 'KB',
          'bytes'  => bytes,
        }
      end
    end
  
    it "27 MB" do
      [
        InfoUnit.new(27, 'MB'),
        InfoUnit.new('27MB'),
        InfoUnit.new('27 MB'),
      ].each do |x|
        bytes = 27 * 1048576
        x.number.should == 27
        x.unit.should == 'MB'
        x.bytes.should == bytes
        x.to_hash.should == {
          'number' => 27,
          'unit'   => 'MB',
          'bytes'  => bytes,
        }
      end
    end

    it "2.3 MB" do
      [
        InfoUnit.new(2.3, 'MB'),
        InfoUnit.new('2.3MB'),
        InfoUnit.new('2.3 MB'),
      ].each do |x|
        bytes = 2.3 * 1048576
        x.number.should == 2.3
        x.unit.should == 'MB'
        x.bytes.should == bytes
        x.to_hash.should == {
          'number' => 2.3,
          'unit'   => 'MB',
          'bytes'  => bytes,
        }
      end
    end

    it "1.01 KB" do
      [
        InfoUnit.new(1.01, 'KB'),
        InfoUnit.new('1.01KB'),
        InfoUnit.new('1.01 KB'),
      ].each do |x|
        bytes = 1.01 * 1024
        x.number.should == 1.01
        x.unit.should == 'KB'
        x.bytes.should == bytes
        x.to_hash.should == {
          'number' => 1.01,
          'unit'   => 'KB',
          'bytes'  => bytes,
        }
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
