require_relative 'page_generator'

if ARGV.size == 0
  puts "Usage: ruby router.rb [action]"
  exit
end

action = ARGV[0]

if action == 'index' || action == 'random'
  # 
  page_generator = WebPageGenerator.new
  page_generator.generate_list(action)

  puts "Unknown action!  Try again."
end
