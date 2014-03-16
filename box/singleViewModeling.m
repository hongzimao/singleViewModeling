function singleViewModeling()
input=imread('box.bmp');
[img.X, img.Y, img.RGB] = size(input);
canvas.figure= figure;
imshow(input);
hold on

maxPt = 8;  % maximum number of points input
mode = 'v'; % computing vanishing point mode
canvas.numPt = 0;
canvas.pt = [];
disp('to compute vanishing points');
set(canvas.figure, 'WindowButtonDownFcn', @DrawPoint);

    function DrawPoint(varargin)
        if strcmp(mode,'v') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == maxPt
                canvas.vanishingPt = calculateVanish(canvas.pt);
                disp('vanishing points are');
                disp(canvas.vanishingPt);
                disp('select origin point');
                mode = 'o'; % select origin mode
            end
            
        elseif strcmp(mode,'o') == 1
            canvas.origin = setOrigin();
            disp('origin is');
            disp(canvas.origin);
            canvas.numPt = 0;
            canvas.pt=[];
            disp('select points on a plane 1');
            mode = 'h1'; % compute matrix H1
            
            
        elseif strcmp(mode,'h1') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = inputdlg('Enter real coordinate(x1, y1, x2, y2..):','Input', [1 70]);
                realPos = str2num(realPos{:});
                canvas.h1 = computeTransMatrixH(canvas.pt, realPos);
                disp('H1 = ');
                disp(canvas.h1);
                
                canvas.numPt = 0;
                canvas.pt = [];
                disp('select the texture plane');
                mode ='h1t';
            end
            
         elseif strcmp(mode,'h1t') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = [];
                for i = 1:4
                   pos = canvas.h1*canvas.pt(i,:)';
                   pos = floor(pos/pos(3));
                   realPos = [pos(1:2)'; realPos];
                end
                textureMap(input, canvas.h1, realPos, mode);
                
                canvas.numPt = 0;
                canvas.pt=[];
                disp('select points on another plane');
                mode = 'h2'; % compute matrix H2
            end
            
        elseif strcmp(mode,'h2') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = inputdlg('Enter real coordinate(x1, y1, x2, y2..):','Input', [1 70]);
                realPos = str2num(realPos{:});
                canvas.h2 = computeTransMatrixH(canvas.pt, realPos);
                disp('H2 = ');
                disp(canvas.h2);
                
                canvas.numPt = 0;
                canvas.pt = [];
                disp('select the texture plane');
                mode ='h2t';
            end
            
         elseif strcmp(mode,'h2t') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = [];
                for i = 1:4
                   pos = canvas.h2*canvas.pt(i,:)';
                   pos = floor(pos/pos(3));
                   realPos = [pos(1:2)'; realPos];
                end
                textureMap(input, canvas.h2, realPos, mode);
                
                canvas.numPt = 0;
                canvas.pt=[];
                disp('select points on another plane');
                mode = 'h3'; % compute matrix H3
            end  
            
        elseif strcmp(mode,'h3') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = inputdlg('Enter real coordinate(x1, y1, x2, y2..):','Input', [1 70]);
                realPos = str2num(realPos{:});
                canvas.h3 = computeTransMatrixH(canvas.pt, realPos);
                disp('H3 = ');
                disp(canvas.h3);
                
                canvas.numPt = 0;
                canvas.pt = [];
                disp('select the texture plane');
                mode ='h3t';
            end
            
         elseif strcmp(mode,'h3t') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == 4
                realPos = [];
                for i = 1:4
                   pos = canvas.h3*canvas.pt(i,:)';
                   pos = floor(pos/pos(3));
                   realPos = [pos(1:2)'; realPos];
                end
                textureMap(input, canvas.h3, realPos, mode);
                
                canvas.numPt = 0;
                canvas.pt=[];
                disp('texture map stored');
                mode = 'f'; % finished
                
            end 
        end
    end
end