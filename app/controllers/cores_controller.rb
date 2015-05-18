class CoresController < ApplicationController

  def index
    @cores = Core.all
  end

  def show
    @core = Core.find(params[:id])
    @days = @core.means.pluck(:day).uniq.sort

    @means     = @core.means.where(day: day)
    @variances = @core.variances.where(day: day)
  end

  private

  def day
    @day ||= if params[:day]
      Date.parse(params[:day])
    else
      Date.today
    end
  end

end
