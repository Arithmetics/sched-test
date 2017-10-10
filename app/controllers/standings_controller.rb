class StandingsController < ApplicationController
  def new
  end


  def index
    @standings = Standing.all
  end


end
