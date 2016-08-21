require_relative "../lib/models/issue"

class App < Sinatra::Base
	enable :sessions
	register Sinatra::Flash

  get "/" do
    redirect "/issues"
  end
	
  get "/issues" do
    @issues = Issue.all
    haml :"issues/index"
  end
end
