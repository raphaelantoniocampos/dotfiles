WORKSPACE=$(
	hyprctl activewindow |
	rg workspace |
	awk '{print $2}');

MONITOR=$(
	hyprctl activewindow |
	rg monitor |
	awk '{print $2}');

echo workspace: $WORKSPACE;
echo monitor: $MONITOR;

hyprctl clients -j |
jq -r --arg WORKSPACE "$WORKSPACE" 'map(select(.workspace.id == ($WORKSPACE|tonumber)))';
