class ThemesController < ApplicationController
  before_action :find_theme, only: [:show]

  def index 
    themes = []
    Theme.all.each { |theme| themes.push(create_theme_object(theme))  }
    render json: themes
  end

  def show 
    render json: create_theme_object(@theme)
    # render json: @theme, include: [:colors]
  end

  private

  def find_theme
    @theme = Theme.find_by(id: params[:id])
  end

  def create_theme_object(theme)
    # byebug
    terminal_colorscheme = theme.terminal_colorscheme
    items_with_colors = []
    if theme.prompt.prompt_items 
      theme.prompt.prompt_items.each { |item| items_with_colors.push({ type: item.prompt_type, colors: item.colors, order: item.order }) } 
    end
    {
      theme: theme,
      terminal_colorscheme: { colors: terminal_colorscheme.colors },
      prompt_items: items_with_colors
    }
  end
end
