/// @description Give me a path to this position
var gridCellSize = 64;

var startX = x;
var startY = y;
var endX = mouse_x;
var endY = mouse_y;

requestID = asyncAStarDistance(startX, startY, endX, endY, gridCellSize);