class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index
  skip_authorize_resource :only => :index

  def index

  end
end
