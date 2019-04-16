require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quel est le nom de ton joueur ?"
print ">>>"
player1 = HumanPlayer.new(gets.chomp.to_s)

array_bot = [bot_1 = Player.new("José"), bot_2 = Player.new("Josiane")]

puts "Début du combat"
while player1.life_points > 0 && (bot_1.life_points > 0 || bot_2.life_points > 0)
  player1.show_state
  gets.chomp
  puts ""
  puts "A toi de jouer"
  puts "Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner

  attaquer un joueur en vie : "

  print "0 - "
  bot_1.show_state
  print "1 - "
  bot_2.show_state
  choice = gets.chomp.to_s
  while !["a","s","0","1"].include?(choice)
    puts "je n'ai pas compris ton choix"
    print ">>>"
    choice = gets.chomp.to_s
  end
  choice == "a" ?
    (player1.search_weapon
    HumanPlayer.weapon)
    : choice == "s" ?
      (player1.search_health_pack
      HumanPlayer.heal)
      : choice == "0"?
        (player1.attack(bot_1)
        Player.next_attack)
        : choice == "1"?
        (player1.attack(bot_2)
        Player.next_attack)
        : (puts "je n'ai pas compris ton choix")
gets.chomp
puts "Les autres joueurs t'attaquent !"
  array_bot.each {|bot|
    if bot.life_points > 0
      bot.attack(player1)
    end
  }
gets.chomp
end
puts "La partie est finie"
if player1.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ !"
else
  puts "Loser ! Tu as perdu !"
end