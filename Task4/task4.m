% SF1546 Numerical Methods, Basic Course, ProjectA
% task4.m - Investigates the relationship between dart mass and dart-throwing
% velocity in regards to dart-throwing

% Hypothesis
% Our hypothesis is that an increased mass will lead to an increase in
% gravitiational pull. Therefore, the force exerted on the dart in the direction
% of the dartboard must increase in order to compenstate for this. 
% The only variable that affects the force is velocity and so an increase 
% in velocity is an increase in force upwards.

% point1 - high ma, high velocity
h= 1e-5;

m = 20e-3;
hv = 30;
mv = 15;
lv = 10;
old = bullsEyeDistanceMV(h, mm, mv) % prior assigments

p1 = bullsEyeDistanceMV(h, hm, lv) 
p2 = bullsEyeDistanceMV(h, hm, mv)
p3 = bullsEyeDistanceMV(h, hm, hv)

plot(1:1:3, [p1, p2, p3])
% En konstant massa m och tre olika hastigheter lv, mv och hv väljs. Det
% är tydligt från observation att när hastigheten är som lägst att pilen
% träffar lägst under bullseye. Dessutom kommer pilen längre och längre upp
% ju högre hastigheten är. Slutsatsen blir då att en tyngre pil kräver en
% högre kast-hastighet och vice versa.

% At first, a constant mass m and three different velocities lv, mv and hv
% are chosen. It is clear from observation that when the velocity increase,
% the arrow hits further under the bullseye. In addition, as dart-throwing speed
% increases so does the point of contact. In conclusion, a heavier dart
% requries a higher throwing velocity and vice versa.
