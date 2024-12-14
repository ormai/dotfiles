function 2hevc --description 'Encode an AVC MP4 to HEVC'
  if test (count $argv) != 1
    echo 'Usage: 2hevc [all|check] [FILE]'
    return 1
  end

  function conv
    set -l output (dirname $argv[1])/hevc_$(basename $argv[1])
    ffmpeg -i $argv[1] -c:v libx265 -vtag hvc1 $output
    and trash $argv[1]
    and mv $output $argv[1]
  end

  function check --description 'Search for MP4s that use AVC'
    for f in **/*.mp4
      if test "$(exiftool -b -CompressorID $f 2>/dev/null)" = avc1
        echo $f
      end
    end
  end

  switch $argv[1]
  case all
    for v in (check)
      conv $v
    end
  case check
    check
  case '*'
    conv $argv[1]
  end
end
