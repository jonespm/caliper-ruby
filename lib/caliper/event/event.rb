require 'json'
require_relative './jsonable'

module Caliper
  module Event
    module EventContext
      ANNOTATION = "http://purl.imsglobal.org/ctx/caliper/v1/AnnotationEvent"
      ASSESSMENT = "http://purl.imsglobal.org/ctx/caliper/v1/AssessmentEvent"
      ASSESSMENT_ITEM = "http://purl.imsglobal.org/ctx/caliper/v1/AssessmentItemEvent"
      ASSIGNABLE = "http://purl.imsglobal.org/ctx/caliper/v1/AssignableEvent"
      EVENT = "http://purl.imsglobal.org/ctx/caliper/v1/Event"
      MEDIA = "http://purl.imsglobal.org/ctx/caliper/v1/MediaEvent"
      NAVIGATION = "http://purl.imsglobal.org/ctx/caliper/v1/NavigationEvent"
      OUTCOME = "http://purl.imsglobal.org/ctx/caliper/v1/OutcomeEvent"
      SESSION = "http://purl.imsglobal.org/ctx/caliper/v1/SessionEvent"
      VIEW = "http://purl.imsglobal.org/ctx/caliper/v1/ViewEvent"
    end
    module EventType
      ANNOTATION = "http://purl.imsglobal.org/caliper/v1/AnnotationEvent"
      ASSESSMENT = "http://purl.imsglobal.org/caliper/v1/AssessmentEvent"
      ASSESSMENT_ITEM = "http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent"
      ASSIGNABLE = "http://purl.imsglobal.org/caliper/v1/AssignableEvent"
      EVENT = "http://purl.imsglobal.org/caliper/v1/Event"
      MEDIA = "http://purl.imsglobal.org/caliper/v1/MediaEvent"
      NAVIGATION = "http://purl.imsglobal.org/caliper/v1/NavigationEvent"
      OUTCOME = "http://purl.imsglobal.org/caliper/v1/OutcomeEvent"
      SESSION = "http://purl.imsglobal.org/caliper/v1/SessionEvent"
      VIEW = "http://purl.imsglobal.org/caliper/v1/ViewEvent"
    end
    class Event
      include Caliper::Event::Jsonable

      attr_accessor :context, # String Required - the JSON-LD context for the Event

        # Required - the type of the Event
        :type, # String

        # Learning Context
        :edApp,  # SoftwareApplication

        # LIS Group
        :group, # Group

        # Required - Agent (User, System) that performed the action
        :actor, # Agent

        # Required - Action performed by Agent From Metric Profile
        :action, # String

        # Required - "Activity Context" from Metric Profile
        :object, # Object

        # Optional - "target" from Metric Profile
        :target, # Targetable

        # Optional - entity "generated" as result of action - from Metric Profile
        :generated, # Generatable

        # Required time that the event was started at
        :startedAtTime, # ISO-8601 date string

        # An optional time that the event ended at
        :endedAtTime, # ISO-8601 date string

        # An xsd:duration (http://books.xmlschemata.org/relaxng/ch19-77073.html)
        # The format is expected to be PnYnMnDTnHnMnS
        # Valid values include PT1004199059S, PT130S, PT2M10S, P1DT2S, -P1Y, or P1Y2M3DT5H20M30.123S.
        # The following values are invalid: 1Y (leading P is missing), P1S (T separator is missing),
        # P-1Y (all parts must be positive), P1M2Y (parts order is significant and Y must precede M)                                                                                                * or P1Y-1M (all parts must be positive).                                                                               */
        :duration # String

      def initialize()
        @context = EventContext::EVENT
        @type = EventType::EVENT
        @actor = nil
        @action = nil
        @object = nil
        @target = nil
        @generated = nil
        @edApp = nil
        @group = nil
        @startedAtTime = Time.now.utc.iso8601(3)
        @endedAtTime = nil
        @duration = nil
      end
    end
  end
end
