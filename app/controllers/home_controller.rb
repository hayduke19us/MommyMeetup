class HomeController < ApplicationController
  include AttendanceMonitor
  def dashboard
    @total_members = 5
  end
end
