function canvas=drawPoint(canvas)
canvas.numPt = canvas.numPt + 1;
pt = get(gca, 'CurrentPoint');
x=round(pt(1,1));
y=round(pt(1,2));
scatter(x, y,20,'red','fill');
canvas.pt = [canvas.pt ; [x, y, 1]];
end