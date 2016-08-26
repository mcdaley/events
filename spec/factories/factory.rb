#------------------------------------------------------------------------------
# spec/factories/factory.rb
#------------------------------------------------------------------------------
FactoryGirl.define do
  #
  # Organizations
  #
  factory :organization do |f|
    f.name                      "XYZ"
    f.domain                    "xyz.com"
    
    factory :abc do
      name                      "ABC"
      domain                    "abc.com"
    end
  end
  
  #
  # Hosts
  #
  factory :host do |f|
    f.name                      "spock"
    association :organization   factory :organization
    
    factory :kirk do
      name                      "kirk"
    end
    
    factory :scotty do
      name                      "scotty"
    end
    
    factory :warf do
      name                      "warf"
      assocation :organization  factory :abc
    end
    
    factory :klingon do
      name                      "klingon"
      assocation :organization  factory :abc
    end
  end
  
  #
  # Events
  #
  factory :event do |f|
    f.message                   "1st message"
    f.timestamp                 1.day.ago
    association :host           factory :host
  end
end