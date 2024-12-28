class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
    @title = 'Dashboard'
  end
end
