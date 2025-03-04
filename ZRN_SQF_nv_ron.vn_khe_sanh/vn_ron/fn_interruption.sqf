/*
* Author: Zorn
* Function to execute the interruption
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


params ["_requester"];


/*
private _interruption_type = selectRandom ["ENEMY_PATROL", "NOTHING", "ANIMALS"];

switch (_interruption_type) do {
    case "value": { };
};

*/


private _classNames = vn_ron_interruption_enemy_classes;
private _side = selectRandom vn_ron_interruption_enemy_sides;
vn_ron_interruption_enemy_size params ["_size_min", "_size_max"];
private _size = ceil random _size_max max _size_min;

private _ronPosition = getPos _requester;

private _enemy_direction = ceil Random 360;
private _enemy_distance = linearConversion [0,1,random 1, 150, 350];

private _destination_direction = (_enemy_direction + 180) mod 360;
private _destination_distance = linearConversion [0,1,random 1, 500, 3000];

private _waypoint_direction = (_enemy_direction + selectRandom [-90, 90]) mod 360;
private _waypoint_distance = linearConversion [0,1,random 1, 10, 50];

private _pos_enemy_Spawn = _ronPosition getPos [_enemy_distance, _enemy_direction];
private _pos_waypoint =    _ronPosition getPos [_waypoint_distance, _waypoint_direction];
private _pos_destination = _ronPosition getPos [_destination_distance, _destination_direction];


private _grp = createGroup [_side, true];


private _classes = [];
for "_i" from 1 to _size do {
    _classes pushBack selectRandom _classNames;
};


// https://community.bistudio.com/wiki/BIS_fnc_spawnGroup
private _grp = [
    _pos_enemy_Spawn,
    _side,
    _classes,
    [],
    [],
    [0.0, 0.25]
] call BIS_fnc_spawnGroup;

_grp deleteGroupWhenEmpty true;

private _wp1 = _grp addWaypoint [_pos_waypoint, 50];
_wp1 setWaypointBehaviour selectRandom ["SAFE","AWARE"];

private _wp2 = _grp addWaypoint [_pos_destination, 50];

private _wp3 = _grp addWaypoint [
    locationPosition nearestLocation [_pos_destination, vn_ron_interruption_location_types],
    100
];

_wp3 setWaypointLoiterRadius 200;
_wp3 setWaypointLoiterType selectRandom ["CIRCLE", "CIRCLE_L"];

