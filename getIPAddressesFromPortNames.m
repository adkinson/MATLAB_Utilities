function ipAddresses = getIPAddressesFromPortNames(networkPortNames)

networkPortNames = cellstr(networkPortNames);
ipAddresses = cell(size(networkPortNames));
for i = 1:length(networkPortNames)
    [~,out] = system(['netsh interface ip show address "',networkPortNames{i},'" | findstr "IP Address"']);
    ipAddresses{i} = regexp(out,'[\d\.]+','match');
end
ipAddresses = vertcat(ipAddresses{:});

end