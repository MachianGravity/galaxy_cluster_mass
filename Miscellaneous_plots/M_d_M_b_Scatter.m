V = load('r_g_gu_gl_d_ds.txt');

x = V(:,2);
xerr_high = V(:,3);
xerr_low = V(:,4);

y = V(:,5);
yerr_high = V(:,6);
yerr_low = V(:,6);

figure; hold on;

%% 2️⃣ Y-error bars
errorbar(x, y, yerr_low, yerr_high, ...
         'LineStyle', 'none', 'Color', [0.87,0.33,0.00], 'LineWidth', 2, 'CapSize', 0)

%% 3️⃣ X-error bars (manual)
for i = 1:length(x)
    % main bar
    line([x(i)-xerr_low(i), x(i)+xerr_high(i)], ...
         [y(i), y(i)], 'Color', [0.87,0.33,0.00], 'LineWidth', 2)
end


%% 1️⃣ Scatter
%scatter(x, y, 'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);
scatter(x, y, 15,'MarkerEdgeColor', [0.87,0.33,0.00], 'MarkerFaceColor', [1,0.91,0.39], 'LineWidth', 1.5);

%% 4️⃣ Log–log linear fit  (power-law fit)
% log(y) = a log(x) + b  →  y = 10^b * x^a
lx = log10(x);
ly = log10(y);

p = polyfit(lx, ly, 1);   % linear in log-space
a = p(1);                 % slope
b = p(2);                 % intercept
a
b
xf = logspace(log10(min(x)), log10(max(x)), 300);
yf = 10.^b .* xf.^a;

plot(xf, yf, 'k-', 'LineWidth', 2)

%% 5️⃣ Log–log axes
set(gca, 'XScale', 'log', 'YScale', 'log');



%% Styling
xlabel('$$M_b \;( in \; M_\odot \;)\; $$','Interpreter','latex')
ylabel('$$M_d \;( in  \;M_\odot \;)\; $$','Interpreter','latex')
grid on
box on
set(gca,'FontSize',20,'LineWidth',1.2)

% Fit label
txt = sprintf('y = %.3f x^{%.3f}', 10^b, a);
%legend('Data','Y error','X error','Fit','Location','best')

hold off