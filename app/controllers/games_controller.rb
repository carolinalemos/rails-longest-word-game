require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    score = 0
    letters = params[:letters].split()
    answer = params[:word].upcase.split("")
    answer.each do |let|
      if letters.include?(let)
        letters -= [let]
        score += 1
      else
        return score = 222
      end
      url = "https://wagon-dictionary.herokuapp.com/#{answer.join}"
      found = JSON.parse(open(url).read)["found"]
    end


    raise
  end
end
