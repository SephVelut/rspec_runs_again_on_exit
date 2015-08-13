require 'spec_helper'
require 'test2'

describe Test2 do
  it 'spec_name' do
      r = Test2.new.spawn
      expect(r).to eq(true)
  end
end
