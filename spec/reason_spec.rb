require 'rails_helper'

describe Reason do
  it 'new reasons contain user_id of person that cancelled' do
    rocco = User.create(username: 'rocco')
    chidu = User.create(username: 'chidu')
    reason = rocco.reasons.create(reason: 'chidu was at the pub', pair_id: chidu.id)
    expect(reason.user_id).to eq rocco.id
  end
end
