require 'First_TDD_Projects.rb'

describe '#my_uniq' do
  it 'removes duplicates from an array and returns the unique elements in order' do
    expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
  end
end

describe '#two_sum' do
    it "should not raise an error with an array" do
       expect{[-1, 0, 2, -2, 1].two_sum}.to_not raise_error  
    end
    it "returns unique pairs that sum to zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe '#my_transpose' do
    it 'should transpose rows to columns' do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7], [2, 5, 8]])
    end
end

describe '#stock_picker' do
  it 'returns the most profitable pair of days to buy and sell a stock' do
    expect(stock_picker([1, 100, 2, 3])).to eq([0,1])
  end
end

describe TowersOfHanoi do

  subject(:towers) {TowersOfHanoi.new([1], [3,2], [5,4])}

  describe '#initialize' do
    it 'should create three stack variables each with empty arrays' do
      expect(towers.instance_variable_get("@stack1")).to eq([1])
      expect(towers.instance_variable_get("@stack2")).to eq([3,2])
      expect(towers.instance_variable_get("@stack3")).to eq([5,4])
    end
  end

  describe '#move' do
    subject(:test1) {TowersOfHanoi.new([], [3,2,1], [5,4])}
    context "when the start pile is empty" do
        it "should return false" do
          expect(test1.move([0,1])).to be false
        end
    end
    subject(:test1) {TowersOfHanoi.new([1], [5,4,3,2], [])}
    context "when the start pile is not empty" do
        context "and the end pile is empty" do
          it 'should return true and should move the disk' do
            expect(test1.move([0,2])).to be true
            expect(test1.instance_variable_get('@stack3')).to eq([1])
            expect(test1.instance_variable_get('@stack1')).to eq([])
          end
        end
        subject(:test1) {TowersOfHanoi.new([1], [5,4], [3,2])}
        context 'and the start pile disk is bigger than the end pile disk' do
          it 'should return false and should not move the disk' do
            expect(test1.move([1,2])).to be false
            expect(test1.instance_variable_get('@stack2')).to eq([5,4])
            expect(test1.instance_variable_get('@stack3')).to eq([3,2])
          end
        end
        context 'and the start pile disk is smaller than the end pile disk' do
          it 'should return true and should move the disk' do
            expect(test1.move([2,1])).to be true
            expect(test1.instance_variable_get('@stack2')).to eq([5,4,2])
            expect(test1.instance_variable_get('@stack3')).to eq([3])
          end
        end
    end
  end

  describe '#won?' do
        subject(:test1) {TowersOfHanoi.new([], [], [5,4,3,2,1])}
        context "when all disks are on the third stack" do
            it "should return true" do
                expect(test1.won?).to be true
            end
        end
        context "when all disks are not on the third stack" do
            subject(:test1) {TowersOfHanoi.new([], [1], [5,4,3,2])}
            it "should return false" do
                expect(test1.won?).to be false
            end
        end
    end

end
 