require 'diary'

describe Diary do

  describe '.all' do
    it 'shows all diary entry entrys' do
    Diary.add(title: 'Day one', entry: "Dear diary day one was very hard")
    Diary.add(title: 'Day two', entry: "Dear diary day two was very hard")
    Diary.add(title: 'Day three', entry: "Dear diary day three was very hard")

    diarys = Diary.all

    expect(diarys.count).to eq(3)
    expect(diarys.last).to be_an_instance_of(Diary)
    expect(diarys.first.title).to eq('Day one')
    expect(diarys.last.entry).to eq("Dear diary day three was very hard")
    end
  end

  describe '.add' do
    it 'adds new diary entries to the database' do
      diary = Diary.add(title: 'Day one', entry: "Dear diary day one was very hard")

      expect(diary).to be_an_instance_of(Diary)
      expect(diary.title).to eq('Day one')
      expect(diary.entry).to eq("Dear diary day one was very hard")
    end
  end

  describe '.find' do
    it 'finds the users id' do
      diary = Diary.add(title: 'Day one', entry: "Dear diary day one was very hard")

      result = Diary.find(id: diary.id)

      expect(result).to be_a(Diary)
      expect(result.id).to eq(diary.id)
      expect(result.title).to eq('Day one')
      expect(result.entry).to eq("Dear diary day one was very hard")
    end
  end
end
