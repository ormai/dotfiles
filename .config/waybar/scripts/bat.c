// Read information from the two batteries on my Thinkpad, then output the
// average charging level and status for Waybar to display.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  const size_t status_len = 20, level_len = 4;
  FILE *bat0_status_in = fopen("/sys/class/power_supply/BAT0/status", "r"),
       *bat1_status_in = fopen("/sys/class/power_supply/BAT1/status", "r"),
       *bat0_level_in = fopen("/sys/class/power_supply/BAT0/capacity", "r"),
       *bat1_level_in = fopen("/sys/class/power_supply/BAT1/capacity", "r");
  char bat0_status[status_len], bat1_status[status_len], bat0_level[level_len],
      bat1_level[level_len];
  fgets(bat0_status, status_len, bat0_status_in);
  fgets(bat1_status, status_len, bat1_status_in);
  fgets(bat0_level, level_len, bat0_level_in);
  fgets(bat1_level, level_len, bat1_level_in);
  fclose(bat0_status_in);
  fclose(bat1_status_in);
  fclose(bat0_level_in);
  fclose(bat1_level_in);

  char *charging_fmt = "";
  if (!strcmp(bat0_status, "Charging") || !strcmp(bat1_status, "Charging"))
    charging_fmt = "󱐋";

  const int level = (atoi(bat0_level) + atoi(bat1_level)) / 2;
  char *class = "";
  if (level < 20) {
    class = "critical";
    if (level < 3)
      system("notify-send -u critical 'Low battery'");
  }

  const char *icons[] = {"", "", "", "", ""};
  printf("%s %d%% %s\n%s\n", charging_fmt, level,
         icons[level == 100 ? 4 : level / 20], class);
  exit(EXIT_SUCCESS);
}
