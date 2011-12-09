# TODO
# Automatically install RVM

files = %w(gvimrc.local gitconfig rspec rvmrc zshrc gemrc janus.rake ackrc vimrc.local)
bin = %w(cloudapp pretty)
gems = %w(cloudapp_api pivotal-tracker pivotxt bundler gist coderay tidy)
brews = %w(willgit colordiff autojump wget ack git git-flow libyaml node phantomjs qt watch redis readline postgresql paralell imagemagic libxml2 mercurial https://raw.github.com/adamv/homebrew-alt/master/duplicates/vim.rb)
scripts = %w(publish_to.sh)

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
  bin.each do |file|
    run "rm /usr/local/bin/#{file}"
  end
end

task :configs do
  puts "Copying config files..."
  files.each do |file|
    path = File.join(File.dirname(__FILE__), file)
    run "cp #{path} ~/.#{file}"
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

task :bin do
  bin.each do |file|
    path = File.join(File.dirname(__FILE__), "bin", file)
    run "cp #{path} /usr/local/bin/#{file}"
  end
end

task :scripts do
  run "mkdir ~/.scripts" unless Dir.exists?("/Users/keith/.scripts")
  scripts.each do |script|
    path = File.join(File.dirname(__FILE__), "scripts", script)
    run "cp #{path} ~/.scripts/#{script}"
  end
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

task :default => [ :clean, :configs, :bin, :github, :cloudapp, :gems, :brews, :scripts ]
