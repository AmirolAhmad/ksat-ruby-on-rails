require 'spec_helper'

describe KsatList do
  it { should have_many(:task_items) }
end
