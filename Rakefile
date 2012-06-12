# Rakefile for installing dotfiles
# Taken from rbates originally
# 

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_janus
  customize_janus
  link_dotfiles
end

def install_janus
  puts "Installing janus..."
  system %Q{ curl -Lo- https://bit.ly/janus-bootstrap | bash }
end

def customize_janus
  puts "Installing custom plugins for Vim"
  system %Q{ git clone https://github.com/ciryon/.janus.git ~/.janus }
  system %Q{ cd ~/.janus; git submodule update --init --recursive }
end

def link_dotfiles
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md]
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

