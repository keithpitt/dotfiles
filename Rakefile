# TODO
# Automatically install RVM

files = %w(gvimrc.local gitconfig rspec rvmrc zshrc gemrc)
bin = %w(cloudapp pretty)
gems = %w(cloudapp_api pivotal-tracker pivotxt bundler gist coderay tidy)

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
  puts "   #{command}"
  output = `#{command} 2>&1`
  puts "   " + red(output.strip.chomp) unless $?.to_i == 0
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

task :setup do
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

task :gems do
  puts "Installing gems I like..."
  run "rvm gemset use global"
  gems.each do |gem|
    run "gem install #{gem}"
  end
end

task :default => [ :clean, :setup, :bin, :github, :cloudapp, :gems ]
