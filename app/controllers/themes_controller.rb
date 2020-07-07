class ThemesController < ApplicationController
  before_action :find_theme, only: [:show]
  skip_before_action :authorized, only: [:index, :show]

  def index 
    themes = []
    Theme.all.each { |theme| themes.push(create_theme_object(theme))  }
    render json: themes
  end

  def show 
    render json: create_theme_object(@theme)
  end

  def create
    theme = Theme.create(name: theme_params[:name], user: current_user)
    if theme.valid?
      prompt = Prompt.create(theme: theme)
      theme_params[:prompt].each do |prompt_item|
        new_item = PromptItem.create(prompt_type: prompt_item["type"], prompt: prompt)
        Color.create(color_type: "background", color: prompt_item["background"], colorable_type: "PromptItem", colorable_id: new_item.id) if prompt_item["background"]
        Color.create(color_type: "foreground", color: prompt_item["foreground"], colorable_type: "PromptItem", colorable_id: new_item.id) if prompt_item["foreground"]
      end

      color_scheme = TerminalColorscheme.create(theme: theme)
      theme_params[:terminal_colorscheme].each do |key, value|
        Color.create(color_type: key, color: value, colorable_type: "TerminalColorscheme", colorable_id: color_scheme.id)
      end
      render json: { message: "theme was created" }, status: :created
    else 
      render json: { error: "theme was not created" }, status: :not_acceptable
    end
  end

  private

  def theme_params
    params.require(:theme).permit(
      :name,
      { 
        prompt: [:type, :background, :foreground]
      },
      {
        terminal_colorscheme: [
          "0",
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          "13",
          "14",
          "15",
          :background,
          :foreground
        ]
      }
    )
  end

  def find_theme
    @theme = Theme.find_by(id: params[:id])
  end

  def create_theme_object(theme)
    terminal_colorscheme = theme.terminal_colorscheme
    items_with_colors = []
    theme.prompt.prompt_items.each { |item| items_with_colors.push({ type: item.prompt_type, colors: item.colors, order: item.order }) } if theme.prompt.prompt_items 

    {
      theme: theme,
      terminal_colorscheme: { colors: terminal_colorscheme.colors },
      prompt_items: items_with_colors
    }
  end
end
