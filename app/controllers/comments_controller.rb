class CommentsController < ApplicationController

  get "/comments" do
    Comment.all.to_json #(get_comment_json_config)
  end

  get "/comments/:id" do
    find_comment
    @comment.to_json
  end

  post "/comments" do
    comment = Comment.create(name: params[:name], comment: params[:comment], ship_id: params[:ship_id])
    comment.to_json
  end

  patch "/comments/:id" do
    find_comment
    @comment.update(comment: params[:comment])
    @comment.to_json
  end

  delete "/comments/:id" do
    find_comment
    @comment.destroy
    @comment.to_json
  end


  private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    # def comment_params   <- doesn't seem to work?
    #   params.permit(:character1_id, :character2_id, :name)
    # end

    def get_comment_json_config()
      {
        methods: [:formatted_time]
      }
    end
  end