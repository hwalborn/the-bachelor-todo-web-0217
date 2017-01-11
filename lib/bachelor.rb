#require "spec/fixtures/contestants.json"
require "pry"
require 'json'

file = File.read('./spec/fixtures/contestants.json')
contestant_data = JSON.parse(file)

def get_first_name_of_season_winner(data, season)
  data.each {|data_season, contestant|
    if data_season == season
      contestant.each {|key, contestant_value|
        if key.has_value?('Winner')
          winner = data[season][data[season].index(key)]['name']
          return winner.split(" ")[0]
        end
      }
    end
  }
end

def get_contestant_name(data, occupation)
  data.each {|season, contestant|
    contestant.each {|key, contestant_value|
      if key.has_value?(occupation)
        return data[season][data[season].index(key)]['name']
      end
    }
  }
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each {|season, contestant|
    contestant.each {|key, value|
      if key.has_value?(hometown)
        count += 1
      end
    }
  }
  count
end

def get_occupation(data, hometown)
  data.each {|season, contestant|
    contestant.each {|key, value|
      if key.has_value?(hometown)
        return data[season][data[season].index(key)]['occupation']
      end
    }
  }
end

def get_average_age_for_season(data, season)
  age = 0
  divider = 0
  data.each {|data_season, contestant|
    if data_season == season
      contestant.each {|key, value|
        age += data[season][data[season].index(key)]['age'].to_f
        divider += 1
      }
    end
  }
  (age / divider).round
end
#puts get_average_age_for_season(contestant_data, 'season 10')
