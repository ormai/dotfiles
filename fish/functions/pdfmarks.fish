function pdfmarks --description 'Add table of contents to a PDF'
  if test (count $argv) != 2 || not string match '*.pdf' $argv[1]
    echo "Usage: pdfmarks input.pdf pdfmarks.txt"
    return 1
  end

  # https://gist.github.com/shreve/0b73d9dcb7ff11336188
  gs -o toc_$argv[1] -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress $argv[1] $argv[2]
end
