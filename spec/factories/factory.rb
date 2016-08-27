#------------------------------------------------------------------------------
# spec/factories/factory.rb
#------------------------------------------------------------------------------
FactoryGirl.define do
  #
  # Organizations
  #
  factory :organization do |f|
    f.name                        "XYZ"
    f.domain                      "xyz.com"
        
    factory :org_3_hosts do
      name                        "ABC"
      domain                      "abc.com"
      
      after(:create) do |org|
        FactoryGirl.create(:host,          organization: org)
        FactoryGirl.create(:host_2_events, organization: org)
        FactoryGirl.create(:host_3_events, organization: org)
      end
    end
  end
  
  #
  # Hosts
  #
  factory :host do |f|
    f.name                        "spock"
    association :organization,    factory: :organization
    
    factory :host_2_events do
      name                        "kirk"
      
      after(:create) do |h|
        FactoryGirl.create(:event_1, host: h)
        FactoryGirl.create(:event_2, host: h)
      end
    end
 
    factory :host_3_events do
      name                        "warf"
      association :organization,  factory: :organization
      
      after(:create) do |h|
        FactoryGirl.create(:event_3, host: h)
        FactoryGirl.create(:event_4, host: h)
        FactoryGirl.create(:event_5, host: h)
      end
      
    end

    factory :host_0_events do
      name                        "klingon"
      association :organization,  factory: :abc
    end
  end
  
  #
  # Events
  #
  factory :event do |f|
    f.message                     "Event message"
    f.timestamp                   1.day.ago
    association :host,            factory: :host
    
    factory :event_1 do
      message                     "1st message"
      timestamp                   3.days.ago
    end
    
    factory :event_2 do
      message                     "2nd message"
      timestamp                   2.days.ago
    end

    factory :event_3 do
      message                     "3rd message"
      timestamp                   4.days.ago
    end    
    
    factory :event_4 do
      message                     "3rd message"
      timestamp                   6.days.ago
    end    
    
    factory :event_5 do
      message                     "3rd message"
      timestamp                   7.days.ago
    end    
  end
  
end # end of FactoryGirl