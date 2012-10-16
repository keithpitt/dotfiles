# TODO
# Automatically install RVM

files = Dir["dots/*"]
gems = %w(cloudapp_api pivotal-tracker pivotxt bundler gist coderay tidy)
brews = %w(willgit colordiff autojump wget ack git git-flow libyaml node phantomjs qt watch redis readline postgresql paralell imagemagic libxml2 mercurial https://raw.github.com/adamv/homebrew-alt/master/duplicates/vim.rb tree ctags proctools)
scripts = Dir["scripts/*"]
npm = %w(statify http-server)
pathogen = [ "git://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-rails",
  "https://github.com/kien/ctrlp.vim.git",
  "https://github.com/tpope/vim-surround.git",
  "git://github.com/godlygeek/tabular.git",
  "https://github.com/ervandew/supertab.git" ]

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

task :cloudapp do
  puts "What is your CloudApp email? "
  email = STDIN.gets.chomp.strip
  puts "What is your CloudApp password? "
  password = STDIN.gets.chomp.strip

  puts "Setting up CloudApp account..."
  run %{echo "#{email}\\n#{password}" > ~/.cloudapp}
end

task :brews do
  brews.each do |recipe|
    run "brew install #{recipe}"
  end
end

task :gems do
  puts "Installing gems I like..."
  run "rvm gemset use global"
  gems.each do |gem|
    run "gem install #{gem}"
  end
end

task :npm do
  npm.each do |package|
    run "npm install -g #{package}"
  end
end

task :pathogen do
  run "mkdir -p ~/.vim/autoload"
  run "rm -rf ~/.vim/bundle"
  run "rm ~/.vim/autoload/pathogen.vim"
  run "ln -s \"#{File.expand_path("./vim")}\" #{File.expand_path("~/.vim/bundle")}"
  run "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
end

task :default => [ :clean, :dots, :github, :cloudapp, :gems, :brews, :scripts, :pathogen ]
