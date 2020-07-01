class ThemesController < ApplicationController
  before_action :find_theme, only: [:show]

  def index 
    theme = Theme.all
    render json: theme, include: [:colors]
  end

  def show 
    render json: @theme, include: [:colors]
  end

  private

  def find_theme
    @theme = Theme.find_by(id: params[:id])
  end
end
