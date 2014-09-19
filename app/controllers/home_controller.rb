class HomeController < ApplicationController
  include AttendanceMonitor
  def dashboard
    @fred = something
  end
end
