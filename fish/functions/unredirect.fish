function unredirect --description 'Takes an URL and prints the redirection chain'
  # https://unix.stackexchange.com/a/680583/648549
  if test (count $argv) != 1
    echo You must provide an URL
    return 1
  end

  set -l url $argv[1]
  set -l count 1
  while set -l next_url (curl -ISsfw '%{redirect_url}\n' -o /dev/null $url)
    set_color yellow
    echo -n $count
    set_color normal
    echo " $url"
    test -z $next_url; and break
    set count (math $count + 1)
    set url $next_url
  end
end
