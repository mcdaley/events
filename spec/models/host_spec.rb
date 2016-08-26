require 'rails_helper'

RSpec.describe Host, type: :model do
  describe 'DB structure' do
    it { is_expected.to     have_db_column( :name             ).of_type( :string   ) }
    it { is_expected.to     have_db_column( :organization_id  ).of_type( :integer  ) }
    it { is_expected.to     have_db_column( :created_at       ).of_type( :datetime ) }
    it { is_expected.to     have_db_column( :updated_at       ).of_type( :datetime ) }
  end # end of describe 'DB structure'
  
  describe 'Validations' do
    it { is_expected.to     validate_presence_of( :name)                   }
    it { is_expected.to     validate_length_of(   :name).is_at_least(1)    }
    it { is_expected.to     validate_length_of(   :name).is_at_most(255)   }
  end
end
