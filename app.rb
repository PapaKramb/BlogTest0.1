#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init_db
	@db = SQLite3::Database.new "BlogTest.db"
	@db.results_as_hash = true
end

before do
	init_db
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do
	erb :new
end

post '/new' do
	username = params[:username]

	if username = ''
		@error = 'Укажите свое имя'
		return erb :new
	end

	erb "Ваше имя добавлено"
end