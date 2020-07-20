a ='C:\Users\ASUS\Desktop\Thesis\Vision Project\My Code\Rename';
A =dir( fullfile(a, '*.jpg') );

fileID = fopen('C:\Users\ASUS\Desktop\Thesis\Vision Project\My Code\Rename\DatasetObjects.txt','w');
for i = 1 : numel( A )
    fprintf(fileID,'%05d.jpg\n',i);
end