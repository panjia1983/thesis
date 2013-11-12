fid = fopen('ckl_data_polydepth/benchmark2/PDg_100000.txt');

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



fid_polydepth = fopen('ckl_data_polydepth++/benchmark2/pd_result_coherence.txt');
pds_polydepth = [];
while ~feof(fid_polydepth)
    id = fscanf(fid_polydepth, '%d', 1);
    pd = fscanf(fid_polydepth, '%f', 1);
    pds_polydepth = [pds_polydepth, pd];
end

fclose(fid_polydepth);



fid_combine = fopen('ckl_data_polydepth++/benchmark2/pd_result_combine.txt');
pds_combine = [];
while ~feof(fid_combine)
    id = fscanf(fid_combine, '%d', 1);
    pd = fscanf(fid_combine, '%f', 1);
    pds_combine = [pds_combine, pd];
end

fclose(fid_combine);


n = size(pds, 2);

set(gca,'FontSize',15)
plot((1:n), pds(1:n), 'r', (1:n), pds_polydepth(1:n), 'm', (1:n), pds_combine(1:n), 'b', 'LineWidth', 2);
legend('Our method', 'PolyDepth++', 'Combination')
xlabel('frame id')
ylabel('PD_g')
xlim([1,n])