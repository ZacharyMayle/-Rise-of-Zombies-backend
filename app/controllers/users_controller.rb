class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, include: [:movies]
    end

    def show
        @user = User.find(params[:id])
        render json: @user, except: [:usermovies_id], include: [:movies]
    end

    def create
        new_user = User.create({
            name: params[:name],
            email: params[:email],
            password: params[:password]
        })
        render json: new_user
    end

    def update
        @user = User.find(params[:id])
        @user.update({
            name: params[:name],
            email: params[:email],
            password: params[:password]

        })
    end

    def destroy

    end
end
