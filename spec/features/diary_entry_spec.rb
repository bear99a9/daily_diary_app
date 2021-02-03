# frozen_string_literal: true

feature 'diary entry' do
  scenario 'it displays the diary entry' do
    diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')
    visit('/diary')

    click_button('Title: Day one')
    expect(current_path).to eq("/diary/#{diary.id}")
    expect(page).to have_content('Dear diary day one was very hard')
    click_button('Back')
    expect(current_path).to eq('/diary')
  end
end
