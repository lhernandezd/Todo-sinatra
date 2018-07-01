require 'sinatra'
require 'make_todo'

get '/' do
  @items = Tarea.all
  @switch = 0
  redirect '/tareas/new' if @items.empty?
  erb :'tareas/index'
end

get '/tareas/new' do
  @switch = 1
  erb :'tareas/new'
end

post '/tareas/new' do
  Tarea.create(params[:title])
  redirect '/'
end

get '/tareas/:id/delete' do
  Tarea.destroy(params[:id])
  redirect '/'
end

get '/tareas/:id/done' do
  Tarea.update(params[:id])
  redirect '/'
end

get '/tareas/done' do
  @items = Tarea.all
  erb :'tareas/done'
end