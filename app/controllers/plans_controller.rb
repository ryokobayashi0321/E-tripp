class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
end
