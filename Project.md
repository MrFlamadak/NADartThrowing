# Project description (English)
The following is an unofficial translation of the section "Projekt A. Pilkastning" in the file ```Projekt.pdf```. That file includes the official description provided for our chosen project in the course SF1546 Numerical Methods, Basic Course.  
  
## Project A. Dart throwing
Modern dart games usually use darts made of plastic or aluminum, and the darts typically weigh between 18 to 30 grams.  

  The dart board is set up on a wall so that the Bull's-eye is 183 cm above the ground and the distance to the wall is 237 cm.  

  The velocity of the darts from different dart throwers have been measured with laser to be between 10 to 30 m/s.  

  The darts are quite narrow with feathers in the back, so the air resistance in the throwing direction is much smaller than in the direction perpendicular to the throwing direction. This gives us that $K_{x} = 0.002$ and $K_{y} = 0.02$.  
  
  The projectile motion of the darts can then be described as the following expressions:  
  
$$m\ddot{y} = -mg - K_{y}\dot{y}V$$
$$m\ddot{x} = -K_{x}\dot{x}V$$
$$V = \sqrt{\dot{x}^2 + \dot{y}^2}$$
where the dots are time derivatives and the gravitation constant is $g = 9.82 N/kg$.  

 **a)** If the darts have the mass 20 g and you throw it with the initial velocity of $v_{0} = 15 m/s$ from the initial height 184 cm with 4 degrees upwards from the horisontal plane, what will the distance from the floor be where the dart hits the board (or the wall)?  
 
 **b)** In what angle must you initially throw the dart in order to hit Bull's-eye? (There are two angles, find both.)  
 
 **c)** If you want to throw the darts 3 degrees upwards, what initial velocity must you throw them in order to hit Bull's-eye?  
 
 **d)** There are darts of different weights. If you choose heavier darts, should you increase the initial throwing velocity or decrease it?
