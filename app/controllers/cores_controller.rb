class CoresController < ApplicationController

  def index
    @cores = Core.all
  end

  def show
    @core = Core.find(params[:id])
  end

end
