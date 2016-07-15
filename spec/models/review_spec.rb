require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe Review do
  it { should have_valid(:body).when('This place was great') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when(3) }
  it { should_not have_valid(:rating).when(nil, '') }

  it { should have_valid(:price).when(4) }
  it { should_not have_valid(:price).when(nil, '') }

  it { should have_valid(:title).when('OMG') }
  it { should_not have_valid(:title).when(nil, '') }

end
