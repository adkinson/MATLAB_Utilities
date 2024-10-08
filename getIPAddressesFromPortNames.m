function ipAddresses = getIPAddressesFromPortNames(networkPortNames)
%GETIPADDRESSFROMPORTNAMES Gets the IP address(es) of the listed NIC port
%names
%
% CODE PURPOSE
% Read the IP address of the associated list of NIC based on the provided
% list of port names.
%
% SYNTAX
% ipAddresses = getIPAddressesFromPortNames(networkPortNames)
%
% INPUT
% networkPortNames - a character or cell array of characters of the names
%                    of the NIC ports
%
% OUTPUT
% ipAddress - a cell array of IP addresses in the same order with respect
%             to the networkPortNames
%
% Author: Joshua Adkinson

networkPortNames = cellstr(networkPortNames);
ipAddresses = cell(size(networkPortNames));
for i = 1:length(networkPortNames)
    [~,out] = system(['netsh interface ip show address "',networkPortNames{i},'" | findstr "IP Address"']);
    ipAddresses{i} = regexp(out,'[\d\.]+','match');
end
ipAddresses = vertcat(ipAddresses{:});

end