require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe Bar do
  it { should have_valid(:name).when('Bar Name1', 'Coogans') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:address).when('Lake Street', 'Deleware Drive') }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:city).when('Boston', 'Providence') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('Massachusetts', 'Rhode Island') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip).when('01770', '02030') }
  it { should_not have_valid(:zip).when(nil, '') }
end
