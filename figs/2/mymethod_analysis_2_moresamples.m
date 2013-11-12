fid = fopen('ckl_data_polydepth++/benchmark2/PDg_10000.txt');

pds = [];
while ~feof(fid)
    pd = fscanf(fid, '%f', 1);
    x = zeros(3);
    R = zeros(3, 3);
    if(pd > 0)
        fscanf(fid, '%f %f %f', 3);
        fscanf(fid, '%f %f %f %f %f %f %f %f %f', 9);
    end
    pds = [pds, pd];
end

fclose(fid);



fid2 = fopen('ckl_data_polydepth++/benchmark2/PDg_100000.txt');
pds2 = [];
while ~feof(fid2)
    pd = fscanf(fid2, '%f', 1);
    x = zeros(3);
    R = zeros(3, 3);
    if(pd > 0)
        fscanf(fid2, '%f %f %f', 3);
        fscanf(fid2, '%f %f %f %f %f %f %f %f %f', 9);
    end
    pds2 = [pds2, pd];
end

fclose(fid2);

fid3 = fopen('ckl_data_polydepth++/benchmark2/PDg_500000.txt');
pds3 = [];
while ~feof(fid3)
    pd = fscanf(fid3, '%f', 1);
    x = zeros(3);
    R = zeros(3, 3);
    if(pd > 0)
        fscanf(fid3, '%f %f %f', 3);
        fscanf(fid3, '%f %f %f %f %f %f %f %f %f', 9);
    end
    pds3 = [pds3, pd];
end

fclose(fid3);

n = size(pds, 2);
size(pds)
size(pds2)

set(gca,'FontSize',15)
plot((1:n), pds, (1:n), min(pds2, pds3));
legend('10000 samples', '500000 samples')
xlabel('frame id')
ylabel('PD_g')
axis tight
