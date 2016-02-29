#
class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :make_view_helper
  before_filter :set_access_control_headers

  # per: Bloc.
  # curl -v -H "Accept: application/json"
  #         -H "Origin: http://registered_application.com"
  #         -H "Content-Type: application/json"
  #         -X POST -d '{"name":"foobar"}'
  #        http://localhost:3000/api/events

  # per: Bloc.
  # To implement CORS, An OPTION request precedes a GET or POST request
  # and checks whether the route accepts a cross-origin request.
  # The browser expects the OPTIONS request to return a 200.
  def preflight
    head 200
  end

  # Note: IF we have a ruby code error and generate an exception as follows:
  #         Completed 500 Internal Server Error in 6ms (ActiveRecord: 0.6ms)
  #         NoMethodError (undefined method `app=' for nil:NilClass):
  #       THEN we return a json response of HTTP/1.1 500 Internal Server Error
  #         and rails error dump html.
  def create
    @view.app = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # Process event, return json reply.
    @view.app.nil? ? event_app_not_found : event_app_found
  end

  private

  # Not a registered site.
  def event_app_not_found
    render json: 'Unregistered application', status: :unprocessable_entity
  end

  def event_app_found
    @view.event = Event.new(event_params_whitelist)
    @view.event.registered_application = @view.app

    @view.event.save ? event_save_success : event_save_failure
  end

  def event_save_success
    # Return a success message:
    render json: @event, status: :created
  end

  def event_save_failure
    # return a failure message:
    render json: { errors: @view.event.errors }, status: :unprocessable_entity
  end

  # Note: IF we generate an exception as follows:
  #         ActionController::ParameterMissing
  #          (param is missing or the value is empty: event):
  #       THEN we return a json response of HTTP/1.1 500 Internal Server Error
  #         and rails error dump html.
  def event_params_whitelist
    params.require(:event).permit(:name)
  end

  # We must set CORS response headers so our controller actions will allow POST
  # requests across domains:
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def make_view_helper
    @view = ApplicationHelper::View.new(self, Event.new)
  end
end
