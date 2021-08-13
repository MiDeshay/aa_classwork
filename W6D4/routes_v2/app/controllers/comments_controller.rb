class CommentsController < ApplicationController

    def index
        user_id = params[:user_id]
        artwork_id = params[:artwork_id]

    
        if user_id 
            artwork_id = -1
        else
            user_id = -1
        end
        
        comments = Comment.find_by_sql( " SELECT DISTINCT comments.*
            FROM comments 
            JOIN artworks ON comments.artwork_id = artworks.id
            JOIN users ON users.id = comments.user_id
            WHERE comments.user_id = #{user_id} 
                OR comments.artwork_id = #{artwork_id} 
            "
            )

        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: unprocessable_entity 
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end

end