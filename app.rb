# frozen_string_literal: true

require 'sinatra'
require 'pg'
require './lib/diary'
require 'sinatra/reloader'

class DailyDiary < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :method_override, :sessions

  get('/') do
    redirect('/diary')
  end

  get('/diary') do
    @diary = Diary.all
    erb :index
  end

  post('/diary') do
    Diary.add(title: params[:title], entry: params[:entry])
    redirect('/diary')
  end

  get('/diary/:id') do
    @user = Diary.find(id: params[:id])
    erb :diary_entry
  end

  delete '/diary/:id/delete' do
    Diary.delete(id: params[:id])
    redirect('/diary')
  end

  get '/diary/:id/edit' do
    p params
    @user_id = params[:id]
    p "this is the user"
    p @user_id
    erb :diary_edit
  end

  patch '/diary/:id/edit' do
    Diary.edit(id: params[:id], title: params[:title], entry: params[:entry])
    redirect('/diary')
  end
end
