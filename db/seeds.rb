User.destroy_all
Theme.destroy_all
Color.destroy_all

User.create(username: "theluispestana", email: "lpestana@protonmail.com")
Theme.create(name: "default_template", user: User.all.first)
Color.create(color: "#272822", color_type: "background", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#F1EBEB", color_type: "foreground", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#48483E", color_type: "0", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#DC2566", color_type: "1", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#8FC029", color_type: "2", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#D4C96E", color_type: "3", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#55BCCE", color_type: "4", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#9358FE", color_type: "5", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#56B7A5", color_type: "6", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#ACADA1", color_type: "7", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#76715E", color_type: "8", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#FA2772", color_type: "9", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#A7E22E", color_type: "10", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#E7DB75", color_type: "11", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#66D9EE", color_type: "12", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#AE82FF", color_type: "13", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#66EFD5", color_type: "14", colorable_id: Theme.all.first.id, colorable_type: "Theme")
Color.create(color: "#CFD0C2", color_type: "15", colorable_id: Theme.all.first.id, colorable_type: "Theme")

10.times do 
  u = User.create(username: Faker::JapaneseMedia::DragonBall.character, email: Faker::Internet.email)
  t = Theme.create(name: Faker::Movies::LordOfTheRings.location, user: User.all.sample)

  index = 0
  16.times do
    Color.create(color: Faker::Color.hex_color, color_type: "#{index}", colorable_id: t.id, colorable_type: "Theme")
    index += 1
  end
  Color.create(color: Faker::Color.hex_color, color_type: "background", colorable_id: t.id, colorable_type: "Theme")
  Color.create(color: Faker::Color.hex_color, color_type: "foreground", colorable_id: t.id, colorable_type: "Theme")
end
