require 'spec_helper'
require 'test'

describe Test do
  it 'spec_name' do
    begin
      r = Test.new.spawn
    rescue SystemExit
    # if we exit! here, rspec will not output again
      #exit!
    end
      expect(r).to eq(true)
  end
end
