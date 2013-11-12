fid = fopen('ckl_data_polydepth/benchmark1b/PD_100000.txt');

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



fid_polydepth = fopen('ckl_data_polydepth/benchmark1b/pd_result_coherence.txt');
pds_polydepth = [];
while ~feof(fid_polydepth)
    id = fscanf(fid_polydepth, '%d', 1);
    pd = fscanf(fid_polydepth, '%f', 1);
    pds_polydepth = [pds_polydepth, pd];
end

fclose(fid_polydepth);


fid_polydepthplus = fopen('ckl_data_polydepth++/benchmark1b/pd_result_coherence++.txt');
pds_polydepthplus = [];
while ~feof(fid_polydepthplus)
    id = fscanf(fid_polydepthplus, '%d', 1);
    pd = fscanf(fid_polydepthplus, '%f', 1);
    pds_polydepthplus = [pds_polydepthplus, pd];
end

fclose(fid_polydepthplus);



fid_combine = fopen('ckl_data_polydepth/benchmark1b/pd_result_combine.txt');
pds_combine = [];
while ~feof(fid_combine)
    id = fscanf(fid_combine, '%d', 1);
    pd = fscanf(fid_combine, '%f', 1);
    pds_combine = [pds_combine, pd];
end

fclose(fid_combine);

fid_gd = fopen('ckl_data_polydepth/benchmark1b/ground_truth.txt');
pds_gd = [];
while ~feof(fid_gd)
    id = fscanf(fid_gd, '%d', 1);
    pd = fscanf(fid_gd, '%f', 1)
    pds_gd = [pds_gd, pd];
end

fclose(fid_gd);

n = size(pds, 2)

for i = 1:n
    if(pds(i) == 0)
        %pds_combine(i) = 0;
        %pds_polydepth(i) = 0;
    end
end

set(gca,'FontSize',15)
plot((1:n), pds_gd(1:n), 'g', (1:n), pds(1:n), 'r', (1:n), pds_polydepth(1:n), 'k', (1:n), pds_polydepthplus(1:n), 'm', (1:n), pds_combine(1:n), 'b', 'LineWidth', 2);
legend('Ground truth', 'Our method', 'PolyDepth', 'PolyDepth++', 'Combination')
xlabel('frame id')
ylabel('PD_t')
axis tight
%plot((1:n), pds(1:n), (1:n), pds_combine(1:n));
