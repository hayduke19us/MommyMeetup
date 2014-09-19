class HomeController < ApplicationController
  include AttendanceMonitor

  def dashboard
    @total_members = members_count
    @members = members_info
  end
end
