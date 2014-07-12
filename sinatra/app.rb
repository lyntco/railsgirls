require "sinatra"
require 'sinatra/reloader'
# require 'binding.pry'

# before do
$coffees = []
# end

def template
  """
  <html>
  <body>
  <form action='/' method='post'>
  What: <input name='what'>
  Cost: <input name='cost'>
  <button type='submit'>add coffee</button>
  </form>
  #{ $coffees.inspect }
  </body>
  </html>
  """
end

get "/" do
  template
end

post "/" do
  $coffees << params
  redirect('/')
end

# "
#   $coffees.each do |coffee,cost|
#     "<li> #{coffee} for $#{cost}</li>"
#   end
#   "
#