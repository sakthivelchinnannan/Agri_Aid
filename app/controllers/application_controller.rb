class ApplicationController < ActionController::Base
  protect_from_forgery
  include FarmersessionsHelper
  include LendersessionsHelper
end
