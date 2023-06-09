% SF1546 Numerical Methods, Basic Course, ProjectA
% task4.m - Investigates the relationship between dart mass and dart-throwing
% velocity in regards to dart-throwing
% keywords: hv = high velocity, lv = low velocity, mv = middle velocity
% mm = middle mass, hm = high mass
clear variables
format long

h = 1e-5;

mm = 20e-3;
hm = 30e-3;

hv = 30;
mv = 15;
lv = 10;
normal = bullsEyeDistanceMV(h, mm, mv) + 1.83 % prior assigments
highMassNormalV = bullsEyeDistanceMV(h, hm, mv) + 1.83
highMassLowV = bullsEyeDistanceMV(h, hm, lv) + 1.83
highMassHighV = bullsEyeDistanceMV(h, hm, hv) + 1.83

% En konstant massa hm och tre olika hastigheter lv, mv och hv väljs. Det
% är tydligt från observation att när hastigheten är som lägst att pilen
% träffar lägst under bullseye. Dessutom kommer pilen längre och längre upp
% ju högre hastigheten är. Slutsatsen blir då att en tyngre pil kräver en
% högre kast-hastighet och vice versa.

% At first, a constant mass hm and three different velocities lv, mv and hv
% are chosen. It is clear from observation that when the velocity decreases,
% the arrow hits further under the bullseye. In addition, as dart-throwing speed
% increases so does the point of contact. In conclusion, a heavier dart
% requries a higher throwing velocity and vice versa.
