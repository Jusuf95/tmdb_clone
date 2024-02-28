defmodule TmdbCloneWeb.MoviesControler do
  use TmdbCloneWeb, :controller
  require Logger
  alias TmdbClone.Movie

  def get_movie(conn, movie_params) do

    res = Movie.get_movies_by_params(movie_params)
        [res] = res

    map = %{
      id: res.id,
      movie_name: res.movie_name,
      author: res.author,
      rate: res.rate,
      date: res.date,
      category: res.category,
      overview: res.overview,
      time: res.time
    }
    encoded_res = Jason.encode!(map)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, encoded_res)
  end
end
