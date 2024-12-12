function mvn --description 'mvn wrapper'
  command mvn -gs $XDG_CONFIG_HOME/maven/settings.xml $argv
end
