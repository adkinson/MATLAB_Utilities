function cameraControl(command,filename)
%CAMERACONTROL Sends UDP message which can control recordings collected on
%the StreamPix9 Video Acquisition software
%
% CODE PURPOSE
% Write and send UDP messages onto local network which can be read by
% StreamPix9 and initiate/terminate IP camera recordings
%
% SYNTAX
% cameraControl(command,filename)
%
% INPUT
% command - character input values of 'start' and 'stop' which will
%           initiate/terminate camera acquisition, respectively
% filename - base filename to utilized. For each StreamPix9
%           camera/workspace, the name of the given workspace as well as
%           the timestamp for when the recording is started is appended to
%           the base filename
%
% Author: Joshua Adkinson

persistent udpToCamera

if nargin==1
    filename = 'VideoRecording';
end
ip = '10.38.3.164';
port = 6610;

switch command
    case 'start'
        instruction = 'create new avi and start recording';
    case 'stop'
        instruction = 'stop recording, close sequence and export';
    otherwise
        error('Invalid Camera Command')
end
% Write UDP Message
message = ['Action','0001','[',instruction,'(',')]:',filename];

% Send UDP Message
if isempty(udpToCamera)
    udpToCamera = udpport();
end
write(udpToCamera,message,ip,port)

end