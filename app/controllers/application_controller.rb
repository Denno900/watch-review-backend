class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"

    get '/' do
        "Welcome"
    end

    get '/watches' do
        Watch.all.to_json
    end 

    get '/watches/:id' do
        Watch.find(params[:id]).to_json(include: {comments: {only:[:comment], include: :user}})
    end

    get '/comments' do
        Comment.all.order(:created_at).to_json(include: { user: {only: [:username]}})
    end

    get '/comments/:id' do
        Comment.where(watch_id: params[:id]).to_json(include: { user: {only:[:username]} })
    end

    get '/comment/:id' do
        Comment.find(params[:id]).to_json
    end

    post '/comments' do
        Comment.create(
            comment: params[:body],
            watch_id: params[:watch_id],
        )
    end

    patch '/comment/:id' do
        Comment.find(params[:id]).update(
            comment: params[:comment],
        ).to_json
    end

    delete '/comments/:id' do
        comment = Comment.find(params[:id])
        comment.destroy
    end
end