class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

require "#{Rails.root}/app/services/class_fetch_data.rb"