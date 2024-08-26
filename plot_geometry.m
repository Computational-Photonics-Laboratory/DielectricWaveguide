figure('position',[100 500 700 500])
pcolor(x*1e6,y*1e6,abs(n))
xlabel('x (um)')
ylabel('y (um)')
colormap(jet)
colorbar
