p = zeros(8, 3);
c = sqrt(2) / 2;
p(1, :) = [0, 1, pi/2];
p(2, :) = [-c, c, 3*pi/4];
p(3, :) = [-1, 0, pi];
p(4, :) = [-c, -c, 5*pi/4];
p(5, :) = [0, -1, 3*pi/2];
p(6, :) = [c, -c, -pi/4];
p(7, :) = [1, 0, 0];
p(8, :) = [c, c, pi/4];



qx = [-0.3, 0.7];
w = 0.001;

theta = [0:0.1:2*pi];

dmins = zeros(size(theta));

for i = 1:size(theta, 2)
    q = [qx, theta(i)];
    dmin = 100000000000000;
    minid = 0;
    for j = 1 : 8
        dx = q(1) - p(j, 1);
        dy = q(2) - p(j, 2);
        dtheta = q(3) - p(j, 3);
        while dtheta > pi
           dtheta = dtheta - 2 * pi;
        end     
        while dtheta < -pi
           dtheta = dtheta + 2 * pi;    
        end
        
        d = dx * dx + dy * dy + w * dtheta * dtheta;
        if d < dmin
           dmin = d;
           minid = j;
        end
    end 
    dmins(i) = sqrt(dmin);
end

set(gca,'FontSize',12)
plot(theta, dmins);
xlabel('rotation angle')
ylabel('PD value')
axis tight
