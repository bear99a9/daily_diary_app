feature 'edit a entry' do
   scenario 'A user can edit a diary entry' do
     diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')
     visit('/diary')
     click_button('Title: Day one')
     expect(current_path).to eq("/diary/#{diary.id}")
     expect(page).to have_content('Dear diary day one was very hard')

     click_button('Edit')
     expect(current_path).to eq("/diary/#{diary.id}/edit")
     fill_in('title', with: 'Day 1')
     fill_in('entry', with: 'Dear diary day one was very good')
     click_button('Save')

     expect(current_path).to eq("/diary")
     expect(page).to have_content('Title: Day 1')
     expect(page).not_to have_content('Title: Day one')
   end
end
