function computerMute()
%COMPUTERMUTE Mute the computer volume
%
% CODE PURPOSE
% Mute the computer volume
%
% SYNTAX
% computerMute()
%
% Author: Joshua Adkinson

system('nircmd setsysvolume 0');

end