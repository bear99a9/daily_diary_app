feature 'delete' do
  scenario 'A user can delete a diary entry' do
    diary = Diary.add(title: "Day one", entry:"Dear diary day one was very hard")
    visit('/diary')
    click_button("Title: Day one")
    expect(current_path).to eq("/diary/#{diary.id}")
    expect(page).to have_content("Dear diary day one was very hard")

    click_button("Delete")
    expect(current_path).to eq("/diary")
    expect(page).not_to have_content("Dear diary day one was very hard")
  end
end
