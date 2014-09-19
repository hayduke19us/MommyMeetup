class HomeController < ApplicationController
  include AttendanceMonitor

  def dashboard
    @names = members_info.keys
    @total_members = @names.count
  end
end
