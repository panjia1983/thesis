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

theta = pi/8;
y = [-sqrt(1-0.09):0.01:sqrt(1-0.09)];

dmins = zeros(size(y));

for i = 1:size(y, 2)
    dmin = 100000000000000;
    minid = 0;
    for j = 1 : 8
        dx = -0.3 - p(j, 1);
        dy = y(i) - p(j, 2);
        dtheta = theta - p(j, 3);
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
plot(y, dmins);
xlabel('translational movement')
ylabel('PD value')
axis tight