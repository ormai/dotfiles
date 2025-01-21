function cbr2cbz
  if test (count $argv) != 1
    echo Usage: cbr2cbz FILE.cbr
    return 1
  end

  # unrar the .cbr, then create a .cbz with zip
  set -l tmp (string replace -r '\.cbr$' '' $argv[1])
  mkdir -p $tmp
    and unrar e $argv[1] -o $tmp
    and zip -q $tmp.cbz $tmp
    and rm -r $tmp $argv[1]
end
