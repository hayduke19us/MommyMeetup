class HomeController < ApplicationController
  include AttendanceMonitor

  def dashboard
    @total_members = members_count
  end
end
