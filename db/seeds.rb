# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usermovie.destroy_all
User.destroy_all
Movie.destroy_all


json_movies = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=57266b3c9e77e466c4f7b97c3694fa30&language=en-US&query=zombie&page=1&include_adult=false")
parsed_movies = JSON.parse(json_movies)
parsed_movies["results"].map do |movie|
    Movie.create({
        original_title: movie["original_title"],
        release_date: movie["release_date"],
        vote_average: movie["vote_average"],
        vote_count: movie["vote_count"],
        poster: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
        overview: movie["overview"]
    })
end

django = Movie.create(
    original_title: 'Django',
    release_date: '2014',
    vote_average: 5.0,
    vote_count: 300,
    poster: 'None',
    overview: 'great movie'
)

# starwars = Movie.create(
#     original_title: 'Django',
#     release_date: '66',
#     vote_average: 4.0,
#     vote_count: 8909090,
#     poster: 'None',
#     overview: 'cool'
# )

bob = User.create(
    name: "Bob",
    email: "bob@test.com",
    password: "1234"
)

zac = User.create(
    name: "Zac",
    email: "zac@test.com",
    password: "1234"
)

Usermovie.create(user: bob, movie: django)