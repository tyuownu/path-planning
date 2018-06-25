close all
clear all; clc

map = GenerateMap(30, 40, 50);

%% find all obstacle in map
[x, y] = find(map ~= 0);

%% start point 
start_point = GeneratePoint(map, [x, y]);

%% goal point
goal_point = GeneratePoint(map, [x, y]);

%% path planning algorithm

%% 1. A*(A star algorithm)
[path, search_map] = Astar(start_point, goal_point, map);
