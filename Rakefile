files = Dir["dots/*"]

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
  colorize(text, 31)
end

def green(text)
  colorize(text, 32)
end

def run(command)
  puts "  #{green(command)}"
  IO.popen(command) do |io|
    while (line = io.gets) do
      puts "    " + line
    end
  end
end

task :clean do
  puts "Removing files..."
  files.each do |file|
    run "rm ~/.#{file}"
  end
end

task :dots do
  puts "Copying config files..."
  files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    run "rm #{target}" if File.exists?(target)
    run "ln -s #{path} #{target}"
  end
end

task :github do
  puts "What is your GitHub username? "
  username = STDIN.gets.chomp.strip
  puts "What is your Github token? "
  token = STDIN.gets.chomp.strip

  puts "Setting up GitHub account..."
  run "git config --global github.user #{username}"
  run "git config --global github.token #{token}"
end

task :pathogen do
  run "mkdir -p ~/.vim/autoload"
  run "rm -rf ~/.vim/bundle"
  run "rm ~/.vim/autoload/pathogen.vim"
  run "ln -s \"#{File.expand_path("./vim")}\" #{File.expand_path("~/.vim/bundle")}"
  run "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
end

task :default => [ :clean, :dots, :github, :pathogen ]
