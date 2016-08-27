#------------------------------------------------------------------------------
# app/controllers/events_controller.rb
#------------------------------------------------------------------------------
class EventsController < ApplicationController
  def index
    logger.debug("EVENTS: index, params= #{params.inspect}")
    
    @events         = []
    @source         = 'All Events'
    @organizations  = Organization.all
    
    if    !params[:org].blank?
      org     = Organization.find(params[:org])
      @events = Event.events_by_org(org)
      @source = "Organization: #{org.name}"
    elsif !params[:hostname].blank?
      host    = Host.find(params[:hostname])
      @events = Event.events_by_host(host)
      @source = "Host: #{host.name}"
    else
      @events = Event.all
    end  
  end
end
