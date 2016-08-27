require 'rails_helper'

RSpec.describe Event, type: :model do
  
  describe 'DB structure' do
    it { is_expected.to     have_db_column( :message          ).of_type( :string   ) }
    it { is_expected.to     have_db_column( :timestamp        ).of_type( :datetime ) }
    it { is_expected.to     have_db_column( :created_at       ).of_type( :datetime ) }
    it { is_expected.to     have_db_column( :updated_at       ).of_type( :datetime ) }
  end # end of describe 'DB structure'
  
  describe 'Validations' do
    it { is_expected.to     validate_presence_of( :message)                   }
    it { is_expected.to     validate_length_of(   :message).is_at_least(1)    }
    it { is_expected.to     validate_length_of(   :message).is_at_most(255)   }
    
    it { is_expected.to     validate_presence_of( :timestamp)                 }
  end
  
  describe 'Scopes' do
    describe 'events_by_org' do
      let(:org) { FactoryGirl.create(:org_3_hosts) }
      
      it 'Returns all events for an organization' do
        expect(Event.events_by_org(org).length).to        eq 5
      end
      
      it 'Returns "N" events for an organization' do
        expect(Event.events_by_org(org, 2).length).to     eq 2
      end
    end
    
    describe 'events_by_host' do
      let(:host) { FactoryGirl.create(:host_3_events) }
      
      it 'Returns all events for a host' do
        expect(Event.events_by_host(host).length).to      eq 3
      end
      
      it 'Returns "N" events for a host' do
        expect(Event.events_by_host(host, 2).length).to   eq 2
      end
    end
  end # end of describe 'Scopes'
end # end of RSpec.describe Event
