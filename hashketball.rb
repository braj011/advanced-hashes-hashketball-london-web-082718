require 'pry'

def game_hash
   {
 :home => {
   :team_name => "Brooklyn Nets",
   :colors => ["Black", "White"],
   :players => [
     {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
   }, {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
   }, {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
   }, {
     :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
   }, {
     :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
   ]
 },

 :away => {
   :team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => [
     {
       :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
     }, {
       :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
     }, {
       :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
     }, {
       :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
     }, {
       :player_name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
     }
    ]
  }
}
end

=begin 
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

good_practices

=end 

# SHORTHAND REFERENCE FOR PLAYERS

def players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  total_players = home_players + away_players
  total_players    
end

# WHEN players is referred to, it's iterating over the total_players 

# Function 1  - referencing this shorthand method PLAYERS 

def num_points_scored(name)
   find_player = players.find {
     |player| player.fetch(:player_name) == name
   } 
   find_player.fetch(:points).to_i
end 

# Function 2  - referencing this shorthand method PLAYERS 

def shoe_size(name)
  find_shoe = players.find {|player| player.fetch(:player_name) == name }
  find_shoe.fetch(:shoe).to_i
end 

# SHORTHAND REFERENCE FOR TEAMS

def team_stats 
  home_team = game_hash.values_at(:home)
  away_team = game_hash.values_at(:away)
  total_team_stats = home_team + away_team
  total_team_stats
end 

# Function 3 

def team_colors(team_name)
  find_team = team_stats.find {|team| team.fetch(:team_name) == team_name}
  find_team.fetch(:colors)
end 

# Function 4

def team_names
  team_stats.collect do |team|
    team[:team_name]
  end
end 

# Function 5 

def player_numbers(team_name)
   find_numbers = team_stats.find {|team| team.fetch(:team_name) == team_name}
   find_numbers[:players].collect do |player|    # 1
     player[:number]
   end 
end 
 
# 1 - use another enumerator to get each of the player's numbers within that team


# Function 6 
def player_stats(player_name)
  stats = players.find {|player| player.fetch(:player_name) == player_name}
   stats.delete_if {|info, string| info == :player_name}   # 1
end
# NEED TO GET THE VALUES BACK AS INTEGERS

# 1 - removing the player name key from theb return of hashes


# Function 7

# Step 1 

def biggest_shoe
  players.max_by { |player_shoe| player_shoe.fetch(:shoe) } 
end 

players.max_by {|player_shoe| player_shoe.fetch(:shoe)}
# # end 

def big_shoe_rebounds
  
end 

# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
# Remember to think about return values here. 


