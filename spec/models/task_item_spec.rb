require 'spec_helper'

describe TaskItem do
  it { should belong_to(:ksat_list) }
end
