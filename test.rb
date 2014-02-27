require File.expand_path("../lib/game_of_life.rb", __FILE__)
# world = GameOfLife::World.generate_grid([[false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], 
#                                          [true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false], 
#                                          [false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
#                                          [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]])
world = GameOfLife::World.generate_random_grid(120, 70)
interrupted = false
trap("INT") { interrupted = true }
step = 0;
until interrupted do
  puts "\e[H\e[2J"
  print "#{world}\n"
  puts "Step: #{step}\n\n\n\n\n\n\n"
  sleep 0.1
  world.next_generation
  step += 1
end
