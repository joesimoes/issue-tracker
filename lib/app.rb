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

  get "/issues/new" do
    @issue = Issue.new
    haml :"issues/new"
  end

  post "/issues" do
    @issue = Issue.new params[:issue]
    if @issue.save
      redirect "/"
    end
  end
end
