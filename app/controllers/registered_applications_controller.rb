#
class RegisteredApplicationsController < ApplicationController
  before_action :make_view_helper

  # A frequent practice is to place the standard CRUD actions in each controller
  # in the following order:
  #   index, show, new, edit, create, update and destroy.
  #
  def index
    @view.apps = RegisteredApplication.all
    # Response: Controller will forward_to
    #           /views/registered_applications/index.html.erb with @view
  end

  def show
    @view.app = RegisteredApplication.find(params[:id])
    # { ":bath:"=>1, ":football:"=>1, ":mahjong:"=>1, ":musical_keyboard:"=>1,
    #   ":saxophone:"=>1, ":slot_machine:"=>1
    # }
    @view.event_group_counts =
      @view.app.events.group(:name).reorder('name ASC').count
    # @view.events = @view.app.events.group_by(&:name)
    # Response: Controller will forward_to
    #           /views/registered_applications/show.html.erb with @view
  end

  def new
    @view.app = RegisteredApplication.new
    # Response: Controller will forward_to
    #           /views/registered_applications/new.html.erb with @view
    # Note: clicking on the form submit button will POST to create()
  end

  # Note: we get here from a submit button via the new view.
  def create
    @view.app = RegisteredApplication.new(submitted_params_whitelist)
    @view.app.url = fixup_url
    @view.app.user = @view.current_user

    if @view.app.save
      # Response: tell browser to show this new registered site.
      redirect_to @view.app, notice: 'Site was saved successfully.'
    else
      # Response: redisplay the edit form with error msgs.
      flash.now[:alert] = 'Error creating registered site. Please try again.'
      render :new
    end
  end

  def edit
    @view.app = RegisteredApplication.find(params[:id])
    # Response: Controller will forward_to
    #           /views/registered_applications/edit.html.erb
    #           with @view.
    # Note: clicking on the form submit button will POST to update()
  end

  # Note: we get here from a submit button via the edit view.
  def update
    @view.app = RegisteredApplication.find(params[:id])
    @view.app.assign_attributes(submitted_params_whitelist)

    # Response: redirect to or forward_to a view with msgs
    if @view.app.save
      flash[:notice] = 'Registered site was updated'
      # Display the show page for the registered site we just edited.
      redirect_to @view.app
    else
      flash.now[:alert] = 'Error saving Registered Site. Please try again.'
      render :edit
    end
  end

  def destroy
    @view.app = RegisteredApplication.find(params[:id])
    # Response: redirect to or forward_to to a view.
    if @view.app.destroy
      flash[:notice] = "\"#{@view.app.name}\" was deleted successfully."
      # Display list of registered sites for this user.
      redirect_to action: :index
    else
      flash.now[:alert] = 'There was an error deleting this Registered Site.'
      render :show
    end
  end

  private

  def make_view_helper
    @view = ApplicationHelper::View.new(self, RegisteredApplication.new)
  end

  def submitted_params_whitelist
    params.require(:registered_application).permit(:name, :url)
  end

  # Given user input of a partial url, convert to absolute url.
  def fixup_url
    unless @view.app.url.starts_with?('http')
      unless @view.app.url.starts_with?('www')
        @view.app.url = 'www.' << @view.app.url
      end
      @view.app.url = 'http://' << @view.app.url
    end
    @view.app.url
  end
end
