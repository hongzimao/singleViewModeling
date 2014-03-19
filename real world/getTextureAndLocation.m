function getTextureAndLocation()
load canvas;
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
        if canvas.numPt == 4
            realPos = inputdlg('Enter real coordinate(x1, y1, x2, y2..):','Input', [1 70]);
            realPos = str2num(realPos{:});
            canvas.h = computeTransMatrixH(canvas.pt, realPos);
            disp('H = ');
            disp(canvas.h);

            canvas.numPt = 0;
            canvas.pt = [];
            disp('select the texture plane');
            mode = 'm2';
        end
    elseif strcmp(mode, 'm2') == 1
        canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = [];
                for i = 1:4
                   pos = canvas.h*canvas.pt(i,:)';
                   pos = floor(pos/pos(3));
                   realPos = [pos(1:2)'; realPos];
                end
                disp(realPos);
                textureMap(input, canvas.h, realPos);
                
                canvas.numPt = 0;
                canvas.pt=[];
                mode = 'f'; 
            end    
    end
end
end