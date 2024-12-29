function exercism -w exercism
  set -l out (command exercism $argv)
  echo $out
  if test $argv[1] = download && $out[-1]
    cd $out[-1] || return 1
  end
end
