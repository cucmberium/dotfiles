git File.join(ENV['HOME'], '.pyenv') do
  repository 'https://github.com/yyuu/pyenv.git'
end

git File.join(ENV['HOME'], '.pyenv', 'plugins', 'pyenv-virtualenv') do
  repository 'https://github.com/yyuu/pyenv-virtualenv.git'
end
