V = load('r_g_gu_gl_d_ds.txt');

r = V(:,1);

x = V(:,2);
xerr_high = V(:,3);
xerr_low = V(:,4);

y = V(:,5);
yerr_high = V(:,6);
yerr_low = V(:,6);

%% 1️⃣ Scatter r, Md/Mb
figure; hold on;
scatter(r, y./x, 15,'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
xlabel('$$r \;( in \; kpc \;)\; $$','Interpreter','latex')
ylabel('$$ M_d\,/\,M_b $$','Interpreter','latex')
grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)
txt = sprintf('y = %.3f x^{%.3f}', 10^b, a);
hold off

%% 1️⃣ Scatter
figure; hold on;
scatter(x, y./x, 15,'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
xlabel('$$M_b \;( in \; M_\odot \;)\; $$','Interpreter','latex')
ylabel('$$ M_d\,/\,M_b $$','Interpreter','latex')
grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)
txt = sprintf('y = %.3f x^{%.3f}', 10^b, a);
hold off

%% 1️⃣ Scatter
figure; hold on;
scatter(x./r, y./x, 15,'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
xlabel('$$M_b \,/\, r \;( in \; M_\odot / kpc \;)\; $$','Interpreter','latex')
ylabel('$$ M_d\,/\,M_b $$','Interpreter','latex')
grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)
txt = sprintf('y = %.3f x^{%.3f}', 10^b, a);
hold off

%% 1️⃣ Scatter
figure; hold on;
scatter(x./r.^2, y./x, 15,'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);
set(gca, 'XScale', 'log', 'YScale', 'log');
xlabel('$$M_b \,/\, r^2 \;( in \; M_\odot \, /\, kpc^2\;)\; $$','Interpreter','latex')
ylabel('$$ M_d \,/\,M_b $$','Interpreter','latex')
grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)
txt = sprintf('y = %.3f x^{%.3f}', 10^b, a);
hold off

%% 1️⃣ Scatter
figure; 
edges = [0:2:40, Inf];
histogram(y./x,edges);
xlabel('$$ M_d \,/\,M_b $$','Interpreter','latex')
%grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)