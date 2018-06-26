close all
clear all; clc

map = GenerateMap(30, 40, 50);
% map = [
%     0,0,0,0,0,0,0,0,0,0;
%     0,0,0,0,0,0,0,0,0,0;
%     0,0,0,0,0,0,0,0,0,0;
%     0,1,0,0,0,0,0,0,0,0;
%     0,0,0,0,0,0,0,0,0,0;
%     0,0,0,0,0,0,0,0,0,0];

%% find all obstacle in map
[x, y] = find(map ~= 0);

%% start point 
 start_point = GeneratePoint(map, [x, y]);
%% start_point = [1, 1];

%% goal point
 goal_point = GeneratePoint(map, [x, y]);
%% goal_point = [1, 30];

%% path planning algorithm

%% 1. A*(A star algorithm)
[paths, search_map] = Astar(start_point, goal_point, map);

%% to show the paths and search_map
Show(start_point, goal_point, paths, map, search_map )
