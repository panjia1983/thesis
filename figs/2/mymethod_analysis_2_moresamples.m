fid = fopen('ckl_data_polydepth/benchmark2/result10000.txt');

pds = [];
while ~feof(fid)
    pd = fscanf(fid, '%f', 1);
    if(pd > 0)
        fscanf(fid, '%f %f %f', 3);
        fscanf(fid, '%f %f %f %f %f %f %f %f %f', 9);
    end
    pds = [pds, pd];
end

fclose(fid);



fid2 = fopen('ckl_data_polydepth/benchmark2/result100000.txt');
pds2 = [];
transforms2 = [];
while ~feof(fid2)
    pd = fscanf(fid2, '%f', 1);
    transform = zeros(1, 12);
    if(pd > 0)
        x = fscanf(fid2, '%f %f %f', 3);
        R = fscanf(fid2, '%f %f %f %f %f %f %f %f %f', 9);
        transform = [x', R'];
    end
    pds2 = [pds2, pd];
    transforms2 = [transforms2; transform];
end

fclose(fid2);

% fid2a = fopen('ckl_data_polydepth/benchmark2/result100000.txt');
% pds2a = [];
% transforms2a = [];
% while ~feof(fid2a)
%     pd = fscanf(fid2a, '%f', 1);
%     transform = zeros(1, 12);
%     if(pd > 0)
%         x = fscanf(fid2a, '%f %f %f', 3);
%         R = fscanf(fid2a, '%f %f %f %f %f %f %f %f %f', 9);
%         transform = [x', R'];
%     end
%     pds2a = [pds2a, pd];
%     transforms2a = [transforms2a; transform];
% end
% 
% fclose(fid2a);

fid3 = fopen('ckl_data_polydepth/benchmark2/result500000.txt');
pds3 = [];
transforms3 = [];
while ~feof(fid3)
    pd = fscanf(fid3, '%f', 1);
    transform = zeros(1, 12);
    if(pd > 0)
        x = fscanf(fid3, '%f %f %f', 3);
        R = fscanf(fid3, '%f %f %f %f %f %f %f %f %f', 9);
        transform = [x', R'];
    end
    pds3 = [pds3, pd];
    transforms3 = [transforms3; transform];
end

fclose(fid3);

n = size(pds, 2);
size(pds)
size(pds2)

set(gca,'FontSize',15)
plot((1:n), pds, (1:n), pds2, (1:n), pds3);
legend('10000 samples', '100000 samples', '500000 samples')
xlabel('frame id')
ylabel('PD_g')
axis tight




% % write output to txt
% 
% fod1 = fopen('ckl_data_polydepth/benchmark2/result100000_new.txt', 'w');
% for i=1:n
%     if pds2(i) > pds2a(i)
%         if pds2(i) ~= 0
%             fprintf(fod1, '%2.4f ', pds2(i));
%             fprintf(fod1, '%2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f\n', transforms2(i, :));
%         else
%             fprintf(fod1, '%d\n', 0);
%         end
%     else
%         if pds2a(i) ~= 0
%             fprintf(fod1, '%2.4f ', pds2a(i));
%             fprintf(fod1, '%2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f\n', transforms2a(i, :));
%         else
%             fprintf(fod1, '%d\n', 0);
%         end
%     end
% end
% 
% fclose(fod1);
% 
% fod2 = fopen('ckl_data_polydepth/benchmark2/result500000_new.txt', 'w');
% 
% for i=1:n
%     if pds2(i) > pds3(i)
%         if pds3(i) ~= 0
%             fprintf(fod2, '%2.4f ', pds3(i));
%             fprintf(fod2, '%2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f\n', transforms3(i, :));
%         else
%             fprintf(fod2, '%d\n', 0);
%         end
%     else
%         if pds2(i) ~= 0
%             fprintf(fod2, '%2.4f ', pds2(i));
%             fprintf(fod2, '%2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f %2.4f\n', transforms2(i, :));
%         else
%             fprintf(fod2, '%d\n', 0);
%         end
%     end
% end
% fclose(fod2);


% only write PD

fod1 = fopen('ckl_data_polydepth/benchmark2/resultPD10000', 'w');
for i=1:n
    fprintf(fod1, '%2.4f\n', pds(i));
end

fclose(fod1);

fod2 = fopen('ckl_data_polydepth/benchmark2/resultPD100000', 'w');
for i=1:n
    fprintf(fod2, '%2.4f\n', pds2(i));
end

fclose(fod2);

fod3 = fopen('ckl_data_polydepth/benchmark2/resultPD500000', 'w');

for i=1:n
    fprintf(fod3, '%2.4f\n', pds3(i));
end
fclose(fod3);

