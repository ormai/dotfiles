function panes --description "Draw colored panes"
  set -l RESET '\e[0m'

  set -l black '\e[30m'
  set -l red '\e[31m'
  set -l green '\e[32m'
  set -l yellow '\e[33m'
  set -l blue '\e[34m'
  set -l magenta '\e[35m'
  set -l cyan '\e[36m'
  set -l white '\e[37m'

  set -l brblack '\e[90m'
  set -l brred '\e[91m'
  set -l brgreen '\e[92m'
  set -l bryellow '\e[93m'
  set -l brblue '\e[94m'
  set -l brmagenta '\e[95m'
  set -l brcyan '\e[96m'
  set -l brwhite '\e[97m'

  echo -e "\n  $black▄▄▄   $red▄▄▄   $green▄▄▄   $yellow▄▄▄   $blue▄▄▄   $magenta▄▄▄   $cyan▄▄▄   $white▄▄▄"
  echo -e "  $black█$brblack███  $red█$brred███  $green█$brgreen███  $yellow█$bryellow███  $blue█$brblue███  $magenta█$brmagenta███  $cyan█$brcyan███  $white█$brwhite███"
  echo -e "  $black█$brblack███  $red█$brred███  $green█$brgreen███  $yellow█$bryellow███  $blue█$brblue███  $magenta█$brmagenta███  $cyan█$brcyan███  $white█$brwhite███"
  echo -e "   $brblack▀▀▀   $brred▀▀▀   $brgreen▀▀▀   $bryellow▀▀▀   $brblue▀▀▀   $brmagenta▀▀▀   $brcyan▀▀▀   $brwhite▀▀▀$RESET\n"
end
