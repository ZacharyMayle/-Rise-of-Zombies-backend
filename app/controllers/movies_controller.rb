class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        render json: @movies
    end

    def show
        @movie = Movie.find(params[:id])
        render json: @movie
    end

    def create
        new_movie = Movie.create({
            original_title: params([:original_title]),
            release_date: params([:release_date]),
            vote_average: params([:vote_average]),
            vote_count: params([:vote_count]),
            poster: params([:poster]),
            overview: params([:overview])
        })
        render json: new_movie
    end

    def update
        @movie = Movie.find(params[:id])
        @movie.update(
            original_title: params([:original_title]),
            release_date: params([:release_date]),
            vote_average: params([:vote_average]),
            vote_count: params([:vote_count]),
            poster: params([:poster]),
            overview: params([:overview])
        )
        render json: @movie
    end

    def destroy
        @movie = Movie.find(params[:id])
        if @movie.destroy
            render json: { message: "Movie successfully removed" }
        else
            render json: { message: "Movie not found" }
        end
    end
end
