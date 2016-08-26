require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'DB structure' do
    it { is_expected.to     have_db_column( :hostname         ).of_type( :string   ) }
    it { is_expected.to     have_db_column( :message          ).of_type( :string   ) }
    it { is_expected.to     have_db_column( :timestamp        ).of_type( :datetime ) }
    it { is_expected.to     have_db_column( :organization_id  ).of_type( :integer ) }
    it { is_expected.to     have_db_column( :created_at       ).of_type( :datetime ) }
    it { is_expected.to     have_db_column( :updated_at       ).of_type( :datetime ) }
  end # end of describe 'DB structure'
  
  describe 'Validations' do
    it { is_expected.to     validate_presence_of( :hostname)                  }
    it { is_expected.to     validate_length_of(   :hostname).is_at_least(1)   }
    it { is_expected.to     validate_length_of(   :hostname).is_at_most(255)  }
    
    it { is_expected.to     validate_presence_of( :message)                   }
    it { is_expected.to     validate_length_of(   :message).is_at_least(1)    }
    it { is_expected.to     validate_length_of(   :message).is_at_most(255)   }
    
    it { is_expected.to     validate_presence_of( :timestamp)                 }
    it { is_expected.to     validate_presence_of( :organization_id)           }
    it { is_expected.to     belong_to(            :organization)              }
  end
end # end of RSpec.describe Event
