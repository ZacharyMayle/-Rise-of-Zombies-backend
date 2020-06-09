class UsermoviesController < ApplicationController
    def index
        @usermovies = Usermovie.all
        render json: @usermovies
    end

    def show 
        @usermovie = Usermovie.find(params[:id])
        render json: @usermovie
    end

    def create
        @new_usermovie = Usermovie.create({
            user_id: params[:user_id],
            movie_id: params[:movie_id]
        })
        render json: @new_usermovie
    end

    def update
        @user = Usermovie.find(params[:id])
        @user.update(
            user: params[:user_id],
            movie: params[:movie_id]
        )
        render json: @user
    end

    def destroy
        @user = Usermovie.find(params[:id])
        @user.destroy
    end
end
