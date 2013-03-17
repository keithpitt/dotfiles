files = Dir["dots/*"]
bins = Dir["bin/*"]
preferences = Dir["preferences/*"]

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
  colorize(text, 31)
end

def green(text)
  colorize(text, 32)
end

def system(command)
  puts "  #{green(command)}"
  Kernel.system command
end

def run(command)
  puts "  #{green(command)}"
  IO.popen(command) do |io|
    while (line = io.gets) do
      puts "    " + line
    end
  end
end

task :preferences do
  puts "Copying preferences..."
  preferences.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/Library/Preferences/#{name}")
    run "rm #{target}" if File.exists?(target)
    run "ln -s #{path} #{target}"
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

task :bin do
  puts "Copying bin files"
  run "mkdir -p ~/.bin"

  bins.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.bin/#{name}")
    run "rm #{target}" if File.exists?(target)
    run "ln -s #{path} #{target}"
  end
end

task :pathogen do
  puts "Setting up pathogen..."
  run "mkdir -p ~/.vim/autoload"
  run "rm -rf ~/.vim/bundle"
  run "rm ~/.vim/autoload/pathogen.vim"
  run "ln -s \"#{File.expand_path("./vim")}\" #{File.expand_path("~/.vim/bundle")}"
  run "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
end

task :homebrew do
  puts "Installing bomebrew..."
  system %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
end

task :default => [ :bin, :dots, :pathogen, :preferences, :homebrew ]
