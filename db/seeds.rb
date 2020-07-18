User.destroy_all

25.times do 
  u = User.create(username: Faker::JapaneseMedia::DragonBall.character, email: Faker::Internet.email, password: "test")
  t = Theme.create(name: Faker::Movies::LordOfTheRings.location, user: User.all.sample)

  term = TerminalColorscheme.create(theme: t)
  index = 0
  16.times do
    Color.create(color: Faker::Color.hex_color, color_type: "#{index}", colorable_id: term.id, colorable_type: "TerminalColorscheme")
    index += 1
  end
  Color.create(color: Faker::Color.hex_color, color_type: "background", colorable_id: term.id, colorable_type: "TerminalColorscheme")
  Color.create(color: Faker::Color.hex_color, color_type: "foreground", colorable_id: term.id, colorable_type: "TerminalColorscheme")

  p = Prompt.create(theme: t)
  items = ['username', 'date', 'time', "hostname", "workingDirectory", "daydd", "militaryTime"]
  new_item_arr = items
  4.times do
    item = new_item_arr.sample
    new_item_arr.delete(item)
    p_item = PromptItem.create(prompt_type: item, prompt: p)
    Color.create(color: Faker::Color.hex_color, color_type: "background", colorable_id: p_item.id, colorable_type: "PromptItem")
    Color.create(color: Faker::Color.hex_color, color_type: "foreground", colorable_id: p_item.id, colorable_type: "PromptItem")
  end
end
