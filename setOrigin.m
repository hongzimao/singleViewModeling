function origin = setOrigin()
pt = get(gca, 'CurrentPoint');
x=round(pt(1,1));
y=round(pt(1,2));
scatter(x, y, 24,'blue','fill');
origin = [x, y, 1];
end