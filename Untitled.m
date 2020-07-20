fid = fopen('DatasetLTLL.txt');
i = 1;                  % Indices..

while 1
    imagename = fgetl(fid);
    if ~ischar(imagename), break, end       % Meaning: End of File...
     i = i + 1;
end