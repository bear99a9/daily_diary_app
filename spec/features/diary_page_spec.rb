feature 'it has a working homepage' do
  scenario ' it shows a welcome message' do
    visit('/diary')
    expect(page).to have_content("Welcome to your diary")
  end
end

feature 'It allows you to add to your diary' do
  scenario 'it has a from with title and entry' do
    visit('/diary')
    fill_in("title", with: "Day one")
    fill_in("entry", with: "Dear diary day one was very hard")
    click_button("Save Entry")
    expect(page).to have_content("Title: Day one")
  end
end
