# Locations
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_SCREENSHOTS_DIR="$HOME"/Pictures/Screenshots

export HISTFILE="$XDG_DATA_HOME"/bash/history
export HISTSIZE=100000

append_path() { # from /etc/profile on Arch Linux
  case "$PATH" in
    *:"$1":*) ;; # do nothing
    *) PATH="${PATH:+$PATH:}$1" ;; # append
  esac
}
append_path "$HOME"/.local/bin
append_path "$XDG_DATA_HOME"/cargo/bin
append_path "$XDG_DATA_HOME"/gem/ruby/3.0.0/bin
append_path "$XDG_DATA_HOME"/npm/bin
append_path "$XDG_DATA_HOME"/go/bin
append_path "$XDG_DATA_HOME"/pipx/bin
append_path "$XDG_DATA_HOME"/nvim/mason/bin
export PATH

# Applications
export SHELL=/usr/bin/bash
export EDITOR=nvim
export VISUAL=$EDITOR
export TERMINAL=footclient
export BROWSER=firefox
export OPENER=xdg-open
export PAGER=less
export MANPAGER="nvim +Man!"
export MANWIDTH=999 # groff will soft-wrap man pages
# vivid generate gruvbox-dark-soft <https://github.com/sharkdp/vivid>
export LS_COLORS="*~=3;38;2;102;92;84:bd=1;38;2;215;153;33:ca=0;38;2;50;48;47;48;2;204;36;29:cd=3;38;2;250;189;47:di=0;38;2;69;133;136:do=1;38;2;211;134;155:ex=1;38;2;184;187;38:fi=0;38;2;235;219;178;48;2;50;48;47:ln=3;38;2;131;165;152:mh=1:mi=0;38;2;235;219;178;48;2;251;73;52:no=0;38;2;235;219;178;48;2;50;48;47:or=3;38;2;251;73;52:ow=1;38;2;184;187;38:pi=0;38;2;177;98;134:rs=0:sg=0;38;2;50;48;47;48;2;214;93;14:so=1;38;2;177;98;134:st=0;38;2;235;219;178;48;2;69;133;136:su=0;38;2;235;219;178;48;2;204;36;29:tw=3;38;2;235;219;178;48;2;69;133;136:*.1=0;38;2;215;153;33:*.S=0;38;2;152;151;26:*.a=1;38;2;184;187;38:*.c=0;38;2;152;151;26:*.d=0;38;2;152;151;26:*.h=0;38;2;152;151;26:*.m=0;38;2;152;151;26:*.o=3;38;2;102;92;84:*.p=0;38;2;152;151;26:*.r=0;38;2;152;151;26:*.s=0;38;2;152;151;26:*.t=0;38;2;152;151;26:*.v=0;38;2;152;151;26:*.x=0;38;2;215;153;33:*.z=0;38;2;214;93;14:*.7z=0;38;2;214;93;14:*.ai=0;38;2;104;157;106:*.as=0;38;2;152;151;26:*.bc=3;38;2;102;92;84:*.bz=0;38;2;214;93;14:*.cc=0;38;2;152;151;26:*.cp=0;38;2;152;151;26:*.cr=0;38;2;152;151;26:*.cs=0;38;2;152;151;26:*.db=0;38;2;214;93;14:*.di=0;38;2;152;151;26:*.dj=0;38;2;215;153;33:*.el=0;38;2;152;151;26:*.ex=0;38;2;152;151;26:*.fs=0;38;2;152;151;26:*.gd=0;38;2;152;151;26:*.go=0;38;2;152;151;26:*.gv=0;38;2;152;151;26:*.gz=0;38;2;214;93;14:*.ha=0;38;2;152;151;26:*.hh=0;38;2;152;151;26:*.hi=3;38;2;102;92;84:*.hs=0;38;2;152;151;26:*.jl=0;38;2;152;151;26:*.js=0;38;2;152;151;26:*.ko=1;38;2;184;187;38:*.kt=0;38;2;152;151;26:*.la=3;38;2;102;92;84:*.ll=0;38;2;152;151;26:*.lo=3;38;2;102;92;84:*.ma=0;38;2;104;157;106:*.mb=0;38;2;104;157;106:*.md=0;38;2;215;153;33:*.mk=3;38;2;184;187;38:*.ml=0;38;2;152;151;26:*.mn=0;38;2;152;151;26:*.nb=0;38;2;152;151;26:*.nu=0;38;2;152;151;26:*.pl=0;38;2;152;151;26:*.pm=0;38;2;152;151;26:*.po=0;38;2;250;189;47:*.pp=0;38;2;152;151;26:*.ps=1;38;2;131;165;152:*.py=0;38;2;152;151;26:*.rb=0;38;2;152;151;26:*.rm=1;38;2;142;192;124:*.rs=0;38;2;152;151;26:*.sh=0;38;2;152;151;26:*.so=1;38;2;184;187;38:*.td=0;38;2;152;151;26:*.ts=0;38;2;152;151;26:*.ui=0;38;2;250;189;47:*.vb=0;38;2;152;151;26:*.wv=0;38;2;104;157;106:*.xz=0;38;2;214;93;14:*FAQ=1;38;2;250;189;47:*.3ds=0;38;2;104;157;106:*.3fr=0;38;2;104;157;106:*.3mf=0;38;2;104;157;106:*.adb=0;38;2;152;151;26:*.ads=0;38;2;152;151;26:*.aif=0;38;2;104;157;106:*.amf=0;38;2;104;157;106:*.ape=0;38;2;104;157;106:*.apk=0;38;2;214;93;14:*.ari=0;38;2;104;157;106:*.arj=0;38;2;214;93;14:*.arw=0;38;2;104;157;106:*.asa=0;38;2;152;151;26:*.asm=0;38;2;152;151;26:*.aux=3;38;2;102;92;84:*.avi=1;38;2;142;192;124:*.awk=0;38;2;152;151;26:*.bag=0;38;2;214;93;14:*.bak=3;38;2;102;92;84:*.bat=1;38;2;184;187;38:*.bay=0;38;2;104;157;106:*.bbl=3;38;2;102;92;84:*.bcf=3;38;2;102;92;84:*.bib=0;38;2;250;189;47:*.bin=1;38;2;254;128;25:*.blg=3;38;2;102;92;84:*.bmp=0;38;2;104;157;106:*.bsh=0;38;2;152;151;26:*.bst=0;38;2;250;189;47:*.bz2=0;38;2;214;93;14:*.c++=0;38;2;152;151;26:*.cap=0;38;2;104;157;106:*.cfg=0;38;2;250;189;47:*.cgi=0;38;2;152;151;26:*.clj=0;38;2;152;151;26:*.cmd=0;38;2;152;151;26:*.com=1;38;2;184;187;38:*.cpp=0;38;2;152;151;26:*.cr2=0;38;2;104;157;106:*.cr3=0;38;2;104;157;106:*.crw=0;38;2;104;157;106:*.css=0;38;2;152;151;26:*.csv=0;38;2;215;153;33:*.csx=0;38;2;152;151;26:*.cxx=0;38;2;152;151;26:*.dae=0;38;2;104;157;106:*.dat=3;38;2;102;92;84:*.dcr=0;38;2;104;157;106:*.dcs=0;38;2;104;157;106:*.deb=0;38;2;214;93;14:*.def=0;38;2;152;151;26:*.dll=1;38;2;184;187;38:*.dmg=1;38;2;254;128;25:*.dng=0;38;2;104;157;106:*.doc=1;38;2;131;165;152:*.dot=0;38;2;152;151;26:*.dox=3;38;2;184;187;38:*.dpr=0;38;2;152;151;26:*.drf=0;38;2;104;157;106:*.dxf=0;38;2;104;157;106:*.eip=0;38;2;104;157;106:*.elc=0;38;2;152;151;26:*.elm=0;38;2;152;151;26:*.epp=0;38;2;152;151;26:*.eps=0;38;2;104;157;106:*.erf=0;38;2;104;157;106:*.erl=0;38;2;152;151;26:*.exe=1;38;2;184;187;38:*.exr=0;38;2;104;157;106:*.exs=0;38;2;152;151;26:*.fbx=0;38;2;104;157;106:*.fff=0;38;2;104;157;106:*.fls=3;38;2;102;92;84:*.flv=1;38;2;142;192;124:*.fnt=0;38;2;104;157;106:*.fon=0;38;2;104;157;106:*.fsi=0;38;2;152;151;26:*.fsx=0;38;2;152;151;26:*.gif=0;38;2;104;157;106:*.git=3;38;2;102;92;84:*.gmo=0;38;2;250;189;47:*.gpr=0;38;2;104;157;106:*.gvy=0;38;2;152;151;26:*.h++=0;38;2;152;151;26:*.hda=0;38;2;104;157;106:*.hip=0;38;2;104;157;106:*.hpp=0;38;2;152;151;26:*.htc=0;38;2;152;151;26:*.htm=0;38;2;215;153;33:*.hxx=0;38;2;152;151;26:*.ico=0;38;2;104;157;106:*.ics=1;38;2;131;165;152:*.idx=3;38;2;102;92;84:*.igs=0;38;2;104;157;106:*.iiq=0;38;2;104;157;106:*.ilg=3;38;2;102;92;84:*.img=1;38;2;254;128;25:*.iml=0;38;2;250;189;47:*.inc=0;38;2;152;151;26:*.ind=3;38;2;102;92;84:*.ini=0;38;2;250;189;47:*.inl=0;38;2;152;151;26:*.ino=0;38;2;152;151;26:*.ipp=0;38;2;152;151;26:*.iso=1;38;2;254;128;25:*.jar=0;38;2;214;93;14:*.jpg=0;38;2;104;157;106:*.jsx=0;38;2;152;151;26:*.jxl=0;38;2;104;157;106:*.k25=0;38;2;104;157;106:*.kdc=0;38;2;104;157;106:*.kex=1;38;2;131;165;152:*.kra=0;38;2;104;157;106:*.kts=0;38;2;152;151;26:*.log=3;38;2;102;92;84:*.ltx=0;38;2;152;151;26:*.lua=0;38;2;152;151;26:*.m3u=0;38;2;104;157;106:*.m4a=0;38;2;104;157;106:*.m4v=1;38;2;142;192;124:*.mdc=0;38;2;104;157;106:*.mef=0;38;2;104;157;106:*.mid=0;38;2;104;157;106:*.mir=0;38;2;152;151;26:*.mkv=1;38;2;142;192;124:*.mli=0;38;2;152;151;26:*.mos=0;38;2;104;157;106:*.mov=1;38;2;142;192;124:*.mp3=0;38;2;104;157;106:*.mp4=1;38;2;142;192;124:*.mpg=1;38;2;142;192;124:*.mrw=0;38;2;104;157;106:*.msi=0;38;2;214;93;14:*.mtl=0;38;2;104;157;106:*.nef=0;38;2;104;157;106:*.nim=0;38;2;152;151;26:*.nix=0;38;2;250;189;47:*.nrw=0;38;2;104;157;106:*.obj=0;38;2;104;157;106:*.obm=0;38;2;104;157;106:*.odp=1;38;2;131;165;152:*.ods=1;38;2;131;165;152:*.odt=1;38;2;131;165;152:*.ogg=0;38;2;104;157;106:*.ogv=1;38;2;142;192;124:*.orf=0;38;2;104;157;106:*.org=0;38;2;215;153;33:*.otf=0;38;2;104;157;106:*.otl=0;38;2;104;157;106:*.out=3;38;2;102;92;84:*.pas=0;38;2;152;151;26:*.pbm=0;38;2;104;157;106:*.pcx=0;38;2;104;157;106:*.pdf=1;38;2;131;165;152:*.pef=0;38;2;104;157;106:*.pgm=0;38;2;104;157;106:*.php=0;38;2;152;151;26:*.pid=3;38;2;102;92;84:*.pkg=0;38;2;214;93;14:*.png=0;38;2;104;157;106:*.pod=0;38;2;152;151;26:*.pot=0;38;2;250;189;47:*.ppm=0;38;2;104;157;106:*.pps=1;38;2;131;165;152:*.ppt=1;38;2;131;165;152:*.pro=3;38;2;184;187;38:*.ps1=0;38;2;152;151;26:*.psd=0;38;2;104;157;106:*.ptx=0;38;2;104;157;106:*.pxn=0;38;2;104;157;106:*.pyc=3;38;2;102;92;84:*.pyd=3;38;2;102;92;84:*.pyo=3;38;2;102;92;84:*.qoi=0;38;2;104;157;106:*.r3d=0;38;2;104;157;106:*.raf=0;38;2;104;157;106:*.rar=0;38;2;214;93;14:*.raw=0;38;2;104;157;106:*.rpm=0;38;2;214;93;14:*.rst=0;38;2;215;153;33:*.rtf=1;38;2;131;165;152:*.rw2=0;38;2;104;157;106:*.rwl=0;38;2;104;157;106:*.rwz=0;38;2;104;157;106:*.sbt=0;38;2;152;151;26:*.scd=0;38;2;215;153;33:*.sed=0;38;2;152;151;26:*.sql=0;38;2;152;151;26:*.sr2=0;38;2;104;157;106:*.srf=0;38;2;104;157;106:*.srw=0;38;2;104;157;106:*.stl=0;38;2;104;157;106:*.stp=0;38;2;104;157;106:*.sty=3;38;2;102;92;84:*.svg=0;38;2;104;157;106:*.swf=1;38;2;142;192;124:*.swp=3;38;2;102;92;84:*.sxi=1;38;2;131;165;152:*.sxw=1;38;2;131;165;152:*.tar=0;38;2;214;93;14:*.tbz=0;38;2;214;93;14:*.tcl=0;38;2;152;151;26:*.tex=0;38;2;152;151;26:*.tga=0;38;2;104;157;106:*.tgz=0;38;2;214;93;14:*.tif=0;38;2;104;157;106:*.tml=0;38;2;250;189;47:*.tmp=3;38;2;102;92;84:*.toc=3;38;2;102;92;84:*.tsx=0;38;2;152;151;26:*.ttf=0;38;2;104;157;106:*.txt=0;38;2;235;219;178:*.typ=0;38;2;215;153;33:*.usd=0;38;2;104;157;106:*.vcd=1;38;2;254;128;25:*.vim=0;38;2;152;151;26:*.vob=1;38;2;142;192;124:*.vsh=0;38;2;152;151;26:*.wav=0;38;2;104;157;106:*.wma=0;38;2;104;157;106:*.wmv=1;38;2;142;192;124:*.wrl=0;38;2;104;157;106:*.x3d=0;38;2;104;157;106:*.x3f=0;38;2;104;157;106:*.xcf=0;38;2;104;157;106:*.xlr=1;38;2;131;165;152:*.xls=1;38;2;131;165;152:*.xml=0;38;2;215;153;33:*.xmp=0;38;2;250;189;47:*.xpm=0;38;2;104;157;106:*.xvf=0;38;2;104;157;106:*.yml=0;38;2;250;189;47:*.zig=0;38;2;152;151;26:*.zip=0;38;2;214;93;14:*.zsh=0;38;2;152;151;26:*.zst=0;38;2;214;93;14:*NEWS=1;38;2;250;189;47:*TODO=0;38;2;184;187;38:*hgrc=3;38;2;184;187;38:*.avif=0;38;2;104;157;106:*.bash=0;38;2;152;151;26:*.braw=0;38;2;104;157;106:*.conf=0;38;2;250;189;47:*.dart=0;38;2;152;151;26:*.data=0;38;2;104;157;106:*.diff=0;38;2;152;151;26:*.djvu=1;38;2;131;165;152:*.doap=0;38;2;215;153;33:*.docx=1;38;2;131;165;152:*.epub=1;38;2;131;165;152:*.fish=0;38;2;152;151;26:*.flac=0;38;2;104;157;106:*.h264=1;38;2;142;192;124:*.hack=0;38;2;152;151;26:*.heif=0;38;2;104;157;106:*.hgrc=3;38;2;184;187;38:*.html=0;38;2;215;153;33:*.iges=0;38;2;104;157;106:*.info=0;38;2;215;153;33:*.java=0;38;2;152;151;26:*.jpeg=0;38;2;104;157;106:*.json=0;38;2;250;189;47:*.less=0;38;2;152;151;26:*.lisp=0;38;2;152;151;26:*.lock=3;38;2;102;92;84:*.make=3;38;2;184;187;38:*.mojo=0;38;2;152;151;26:*.mpeg=1;38;2;142;192;124:*.nims=0;38;2;152;151;26:*.opml=0;38;2;215;153;33:*.opus=0;38;2;104;157;106:*.orig=3;38;2;102;92;84:*.pptx=1;38;2;131;165;152:*.prql=0;38;2;152;151;26:*.psd1=0;38;2;152;151;26:*.psm1=0;38;2;152;151;26:*.purs=0;38;2;152;151;26:*.raku=0;38;2;152;151;26:*.rasi=0;38;2;250;189;47:*.rlib=3;38;2;102;92;84:*.sass=0;38;2;152;151;26:*.scad=0;38;2;152;151;26:*.scss=0;38;2;152;151;26:*.step=0;38;2;104;157;106:*.tbz2=0;38;2;214;93;14:*.tiff=0;38;2;104;157;106:*.toml=0;38;2;250;189;47:*.tscn=0;38;2;104;157;106:*.usda=0;38;2;104;157;106:*.usdc=0;38;2;104;157;106:*.usdz=0;38;2;104;157;106:*.webm=1;38;2;142;192;124:*.webp=0;38;2;104;157;106:*.woff=0;38;2;104;157;106:*.wrap=0;38;2;250;189;47:*.xbps=0;38;2;214;93;14:*.xlsx=1;38;2;131;165;152:*.yaml=0;38;2;250;189;47:*NOTES=1;38;2;250;189;47:*stdin=3;38;2;102;92;84:*v.mod=3;38;2;184;187;38:*.blend=0;38;2;104;157;106:*.cabal=0;38;2;152;151;26:*.cache=3;38;2;102;92;84:*.class=3;38;2;102;92;84:*.cmake=3;38;2;184;187;38:*.ctags=3;38;2;102;92;84:*.dylib=1;38;2;184;187;38:*.dyn_o=3;38;2;102;92;84:*.gcode=0;38;2;152;151;26:*.ipynb=0;38;2;152;151;26:*.jsonc=0;38;2;250;189;47:*.mdown=0;38;2;215;153;33:*.patch=0;38;2;152;151;26:*.rmeta=3;38;2;102;92;84:*.scala=0;38;2;152;151;26:*.shtml=0;38;2;215;153;33:*.swift=0;38;2;152;151;26:*.toast=1;38;2;254;128;25:*.woff2=0;38;2;104;157;106:*.xhtml=0;38;2;215;153;33:*Icon\r=3;38;2;102;92;84:*LEGACY=1;38;2;250;189;47:*NOTICE=1;38;2;250;189;47:*README=1;38;2;250;189;47:*THANKS=1;38;2;250;189;47:*go.mod=3;38;2;184;187;38:*go.sum=3;38;2;102;92;84:*passwd=0;38;2;250;189;47:*shadow=0;38;2;250;189;47:*stderr=3;38;2;102;92;84:*stdout=3;38;2;102;92;84:*.bashrc=0;38;2;152;151;26:*.config=0;38;2;250;189;47:*.dyn_hi=3;38;2;102;92;84:*.flake8=3;38;2;184;187;38:*.gradle=0;38;2;152;151;26:*.groovy=0;38;2;152;151;26:*.ignore=3;38;2;184;187;38:*.matlab=0;38;2;152;151;26:*.nimble=0;38;2;152;151;26:*AUTHORS=1;38;2;250;189;47:*CHANGES=1;38;2;250;189;47:*COPYING=3;38;2;235;219;178:*CREDITS=1;38;2;250;189;47:*HACKING=1;38;2;250;189;47:*INSTALL=1;38;2;250;189;47:*LICENCE=3;38;2;235;219;178:*LICENSE=3;38;2;235;219;178:*LINGUAS=0;38;2;250;189;47:*NEWS.md=1;38;2;250;189;47:*TODO.md=0;38;2;184;187;38:*VERSION=1;38;2;250;189;47:*.alembic=0;38;2;104;157;106:*.desktop=0;38;2;250;189;47:*.gemspec=3;38;2;184;187;38:*.inputrc=0;38;2;250;189;47:*.mailmap=3;38;2;184;187;38:*Doxyfile=3;38;2;184;187;38:*MANIFEST=1;38;2;250;189;47:*Makefile=3;38;2;184;187;38:*NEWS.txt=1;38;2;250;189;47:*TODO.txt=0;38;2;184;187;38:*makefile=3;38;2;184;187;38:*setup.py=3;38;2;184;187;38:*.DS_Store=3;38;2;102;92;84:*.cmake.in=3;38;2;184;187;38:*.eslintrc=3;38;2;184;187;38:*.fdignore=3;38;2;184;187;38:*.gdshader=0;38;2;104;157;106:*.kdevelop=3;38;2;184;187;38:*.markdown=0;38;2;215;153;33:*.rgignore=3;38;2;184;187;38:*.stignore=3;38;2;102;92;84:*.tfignore=3;38;2;184;187;38:*CHANGELOG=1;38;2;250;189;47:*COPYRIGHT=3;38;2;235;219;178:*ChangeLog=1;38;2;250;189;47:*PLATFORMS=1;38;2;250;189;47:*README.md=1;38;2;250;189;47:*bun.lockb=3;38;2;102;92;84:*changelog=1;38;2;250;189;47:*configure=3;38;2;184;187;38:*.gitconfig=3;38;2;184;187;38:*.gitignore=3;38;2;184;187;38:*.localized=3;38;2;102;92;84:*.scons_opt=3;38;2;102;92;84:*.timestamp=3;38;2;102;92;84:*AUTHORS.md=1;38;2;250;189;47:*CODEOWNERS=3;38;2;184;187;38:*Dockerfile=0;38;2;250;189;47:*INSTALL.md=1;38;2;250;189;47:*MANTEINERS=1;38;2;250;189;47:*README.txt=1;38;2;250;189;47:*SConscript=3;38;2;184;187;38:*SConstruct=3;38;2;184;187;38:*.cirrus.yml=0;38;2;131;165;152:*.excalidraw=0;38;2;104;157;106:*.gitmodules=3;38;2;184;187;38:*.synctex.gz=3;38;2;102;92;84:*.travis.yml=0;38;2;131;165;152:*AUTHORS.txt=1;38;2;250;189;47:*BSDmakefile=3;38;2;184;187;38:*INSTALL.txt=1;38;2;250;189;47:*LICENSE-MIT=3;38;2;235;219;178:*MANIFEST.in=3;38;2;184;187;38:*Makefile.in=3;38;2;102;92;84:*build.ninja=3;38;2;184;187;38:*meson.build=3;38;2;184;187;38:*.applescript=0;38;2;152;151;26:*.fdb_latexmk=3;38;2;102;92;84:*.webmanifest=0;38;2;250;189;47:*CHANGELOG.md=1;38;2;250;189;47:*CONTRIBUTING=1;38;2;250;189;47:*CONTRIBUTORS=1;38;2;250;189;47:*appveyor.yml=0;38;2;131;165;152:*configure.ac=3;38;2;184;187;38:*.bash_profile=0;38;2;152;151;26:*.clang-format=3;38;2;184;187;38:*.editorconfig=3;38;2;184;187;38:*CHANGELOG.txt=1;38;2;250;189;47:*project.godot=0;38;2;250;189;47:*.gitattributes=3;38;2;184;187;38:*.gitlab-ci.yml=0;38;2;131;165;152:*CMakeCache.txt=3;38;2;102;92;84:*CMakeLists.txt=3;38;2;184;187;38:*LICENSE-APACHE=3;38;2;235;219;178:*pyproject.toml=3;38;2;184;187;38:*CODE_OF_CONDUCT=1;38;2;250;189;47:*CONTRIBUTING.md=1;38;2;250;189;47:*CONTRIBUTORS.md=1;38;2;250;189;47:*.sconsign.dblite=3;38;2;102;92;84:*CONTRIBUTING.txt=1;38;2;250;189;47:*CONTRIBUTORS.txt=1;38;2;250;189;47:*requirements.txt=3;38;2;184;187;38:*meson_options.txt=3;38;2;184;187;38:*package-lock.json=3;38;2;102;92;84:*CODE_OF_CONDUCT.md=1;38;2;250;189;47:*.CFUserTextEncoding=3;38;2;102;92;84:*CODE_OF_CONDUCT.txt=1;38;2;250;189;47:*azure-pipelines.yml=0;38;2;131;165;152"

export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export VDPAU_DRIVER=va_gl

# Trying to keep ~ clean <https://wiki.archlinux.org/title/XDG_Base_Directory>
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PIPX_BIN_DIR="$XDG_DATA_HOME"/pipx/bin
export HOME_ETC="$XDG_CONFIG_HOME"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export RANDFILE="$XDG_DATA_HOME"/open-ssl/rnd
export PYTHONHISTFILE="$XDG_DATA_HOME"/python/history
export NODE_REPL_HISTORY="$XDG_CACHE_HOME"/node_repl_history
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _JAVA_AWT_WM_NONREPARENTING=1 # otherwise swing doesn't work
#export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
