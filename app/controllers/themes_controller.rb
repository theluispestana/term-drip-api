class ThemesController < ApplicationController
  before_action :find_theme, only: [:show]

  def index 
    theme = Theme.all
    render json: theme, include: [:colors]
  end

  def show 
    theme = Theme.find_by(id: params[:id])
    colors = theme.colors
    render json: { theme: theme, colors: colors }
    # render json: @theme, include: [:colors]
  end

  private

  def find_theme
    @theme = Theme.find_by(id: params[:id])
  end
end
