require 'sinatra/base'
require './lib/board.rb'
require './lib/cell.rb'
require './lib/player.rb'
require './lib/ship.rb'
require './lib/water.rb'
require 'byebug'

class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  set :static, true # From https://stackoverflow.com/questions/6762642/sinatra-css-images-issue?rq=1
  set :public_dir, 'assets' # From https://stackoverflow.com/questions/6762642/sinatra-css-images-issue?rq=1
  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    p1 = Player.new(@name1)
    p2 = Player.new(@name2)
    p1.board = Board.new({size: 100, cell: Cell, number_of_pieces: 5})
    p2.board = Board.new({size: 100, cell: Cell, number_of_pieces: 5})
    session[:name1] = params[:name1]
    session[:name2] = params[:name2]
    session[:p1] = p1
    session[:p2] = p2
    session[:p1b] = p1.board
    session[:p2b] = p2.board
    erb :new_game
  end

  # Start server if Ruby file executed directly
  run! if app_file == $0
end
