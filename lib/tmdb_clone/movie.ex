defmodule TmdbClone.Movie do
  import Ecto.Query, warn: false
  alias TmdbClone.Movies
  alias TmdbClone.Repo

  alias TmdbClone.Schema.Movies

  def list_movies do
    Repo.all(Movies)
  end

  def get_movie_by_name(%{"movie_name" => name}) do
    Movies
    |> where(movie_name: ^name)
    |> Repo.one()
  end
  def get_movies_by_params(params) do
    all_movies = Repo.all(Movies)
    filter_movies(all_movies, params)
  end

  defp filter_movies(movies, params) do
    Enum.filter(movies, fn movie ->
      filter_movie(movie, params)
    end)
  end

  defp filter_movie(movie, params) do
    Enum.all?(params, fn {field, value} ->
      case value do
        nil -> true
        _ ->
          case field do
            "movie_name" -> movie.movie_name == value
          "author" -> movie.author == value
          #"rate" -> movie.rate == String.to_float(value)
          #"date" -> movie.date == String.to(value)
          "category" -> movie.category == value
          "overview" -> movie.overview == value
          "time" -> movie.time == value
          end
      end
    end)
  end


end
