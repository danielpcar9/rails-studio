module MoviesHelper
  def total_gross(movie)
    movie.flop? ? "Flop!" : number_to_currency(movie.total_gross, precision: 0)
  end

  def year_of(movie)
    movie.released_on&.year
  end

  def nav_link_to(text, url)
    link_to(text, url, class: current_page?(url) ? "active" : nil)
  end
end
