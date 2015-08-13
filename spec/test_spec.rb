require 'spec_helper'
require 'test'

describe Test do
  it 'spec_name' do
    begin
      r = Test.new.spawn
    rescue SystemExit
      exit!
    end
      expect(r).to eq(true)
  end
end
