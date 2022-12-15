class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  after_create_commit :broadcast_event

  private

  def broadcast_event
    events = EventAggregatorService.new.aggregate_events
    broadcast_replace_to "ahoy_events",
                          target: "events_chart",
                          partial: "ahoy/chart",
                          locals: { events: events }
  end
end
