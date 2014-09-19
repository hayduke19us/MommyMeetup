class HomeController < ApplicationController
  include AttendanceMonitor

  def dashboard
    @total_members = members_count
    @members_names = members_info
  end
end
