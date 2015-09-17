require 'rubygems'

use Rack::Static, :urls => ['/css', '/js', '/images', '/fonts'], root: 'assets'

require File.join(File.dirname(__FILE__), 'lib/battleships_web.rb')

run BattleshipsWeb