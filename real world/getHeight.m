function getHeight()
load canvas;
refH = 1;
vanishingLine = cross(canvas.vanishingPt1, canvas.vanishingPt3);

input=imread('photo.jpg');
canvas.figure= figure;
imshow(input);
hold on

mode = 'm1';

canvas.numPt = 0;
canvas.pt = [];
set(canvas.figure, 'WindowButtonDownFcn', @DrawPoint);

function DrawPoint(varargin)
   if strcmp(mode,'m1') == 1
      canvas=drawPoint(canvas);
      refH = inputdlg('Enter reference hight:','Input', [1 70]);
      refH = str2num(refH{:});
      canvas.refPt = canvas.pt;
      
      canvas.numPt = 0;
      canvas.pt = [];
      mode = 'm2';
      
   elseif strcmp(mode, 'm2') == 1
      canvas=drawPoint(canvas);
      canvas.basePt = canvas.pt;
      
      canvas.numPt = 0;
      canvas.pt = [];
      mode = 'm3';
      
   elseif strcmp(mode, 'm3') == 1
       canvas=drawPoint(canvas);
       
       L = cross(canvas.origin, canvas.basePt);
       vaniPt = cross(L, vanishingLine);
       L = cross(vaniPt, canvas.pt);
       L2 = cross(canvas.origin, canvas.refPt);
       Height = cross(L, L2);
       
       Height = Height/Height(3);
       realHeight = norm(Height-canvas.origin)/norm(canvas.refPt-canvas.origin)*refH;
       disp(realHeight);
   end
end
end