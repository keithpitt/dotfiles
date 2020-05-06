files = Dir["dots/*"]
bins = Dir["bin/*"]

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

task :dots do
  puts "Copying config files..."
  files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    name = File.basename(file)
    target = File.expand_path("~/.#{name}")
    run "rm -rf #{target}"
    run "ln -s #{path} #{target}"
  end
end

task :vundler do
  puts "Setting up vundler..."
  run "git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
end

task :brew do
  run "brew install zsh"
  run "brew install autojump"
  run "brew install chruby"
  run "brew install vim"
  run "brew install git"
  run "brew install ruby-build"
  run "brew install direnv"
end

task :zsh do
  run "rm -rf ~/.zsh/zsh-autosuggestions"
  run "git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
  run "cd ~/.zsh/zsh-autosuggestions; git checkout origin/develop"
end

task :default => [ :dots, :vundler, :brew, :zsh ]
