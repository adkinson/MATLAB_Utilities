function computerMaxVolume()
%COMPUTERMAXVOLUME Set the volume of the computer to its maximum settings
%
% CODE PURPOSE
% Set the volume of the computer to its maximum settings
%
% SYNTAX
% computerMaxVolume()
%
% Author: Joshua Adkinson

system('nircmd mutesysvolume 0');
system('nircmd setsysvolume 65535');

end