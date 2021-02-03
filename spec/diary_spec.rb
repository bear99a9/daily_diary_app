# frozen_string_literal: true

require 'diary'

describe Diary do
  describe '.all' do
    it 'shows all diary entry entrys' do
      Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')
      Diary.add(title: 'Day two', entry: 'Dear diary day two was very hard')
      Diary.add(title: 'Day three', entry: 'Dear diary day three was very hard')

      diarys = Diary.all

      expect(diarys.count).to eq(3)
      expect(diarys.last).to be_an_instance_of(Diary)
      expect(diarys.first.title).to eq('Day one')
      expect(diarys.last.entry).to eq('Dear diary day three was very hard')
    end
  end

  describe '.add' do
    it 'adds new diary entries to the database' do
      diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')

      expect(diary).to be_an_instance_of(Diary)
      expect(diary.title).to eq('Day one')
      expect(diary.entry).to eq('Dear diary day one was very hard')
    end
  end

  describe '.find' do
    it 'finds the users id' do
      diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')

      result = Diary.find(id: diary.id)

      expect(result).to be_a(Diary)
      expect(result.id).to eq(diary.id)
      expect(result.title).to eq('Day one')
      expect(result.entry).to eq('Dear diary day one was very hard')
    end
  end

  describe '.delete' do
    it 'deletes the diary entry' do
      diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')
      Diary.delete(id: diary.id)

      expect(Diary.all.count).to eq(0)
    end
  end

  describe '.edit' do
    it 'updates the diary entry' do
      diary = Diary.add(title: 'Day one', entry: 'Dear diary day one was very hard')
      edited_diary = Diary.edit(id: diary.id, title: 'Day one', entry: 'Dear diary day one was very hard')

      expect(edited_diary).to be_a(Diary)
      expect(edited_diary.id).to eq(diary.id)
      expect(edited_diary.title).to eq("Day one")
      expect(edited_diary.entry).to eq("Dear diary day one was very hard")
    end
  end
end
