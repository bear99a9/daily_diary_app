require 'sinatra'
require 'pg'
require './lib/diary'
require 'sinatra/reloader'

class DailyDiary < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get ('/diary') do
    @diary = Diary.all
    erb :index
  end

  post ('/diary') do
    Diary.add(title: params[:title], entry: params[:entry])
    redirect('/diary')
  end

  get ('/diary/:id') do
    p params
    @user = Diary.find(id: params[:id])
    erb :diary_entry
  end

end
