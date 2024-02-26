function camRec = cameraTimeCheck()
%CAMERATIMECHECK Checks current time to determine whether to collect camera
%recordings
%
% CODE PURPOSE
% Check the current time to determine if cameras should be recorded.
% Current camera setup (October 2023) does not include infrared cameras, so
% collection of camera footage at night in a dark room generates data that
% cannot be used.
%
% SYNTAX
% camRec = cameraTimeCheck()
%
% OUTPUT
% camRec - a boolean indicating whether camera data should be acquired
%
% Author: Joshua Adkinson

%% Time Check for Video
time = datetime('now');
% only allows StartBlackrockAcquisition to run between 7AM and 10PM
if time.Hour>=7 && time.Hour<22
    camRec = true;
else
    camRec = false;
end

end