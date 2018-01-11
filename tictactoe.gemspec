Gem::Specification.new do |s|
  s.name                    = 'tictactoe'
  s.version                 = '0.0.2'
  s.date                    = '2018-01-11'
  s.summary                 = "A simple Tic-Tac-Toe game"
  s.description             = "A simple Tic-Tac-Toe CLI game as an exercise to learn Ruby language"
  s.authors                 = ["Mario Negro"]
  s.email                   = 'mario.negro.martin@gmail.com'
  s.files                   = Dir["{bin,lib}/**/*"]
  s.homepage                = 'https://github.com/emenegro/tictactoe'
  s.license                 = 'MIT'
  s.executables             << "tictactoe"
  s.add_runtime_dependency  'colorize', '~> 0.8.1'
end