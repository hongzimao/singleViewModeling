function singleViewModeling()
input=imread('photo.jpg');
[img.X, img.Y, img.RGB] = size(input);
canvas.figure= figure;
imshow(input);
hold on

maxPt = 8;  % maximum number of points input
mode = 'v1'; % computing vanishing point mode
canvas.numPt = 0;
canvas.pt = [];
disp('to compute vanishing points');
set(canvas.figure, 'WindowButtonDownFcn', @DrawPoint);

    function DrawPoint(varargin)
        if strcmp(mode,'v1') == 1
            canvas=drawPoint(canvas);
            if canvas.numPt == maxPt
                canvas.vanishingPt1 = calculateVanish(canvas.pt);
                disp('vanishing point is');
                disp(canvas.vanishingPt1);
                disp('to compute another vanishing points');
                canvas.numPt = 0;
                canvas.pt=[];
                mode = 'v2'; % another vanishing point
            end
        
        elseif strcmp(mode,'v2') == 1
        canvas=drawPoint(canvas);
        if canvas.numPt == maxPt
            canvas.vanishingPt2 = calculateVanish(canvas.pt);
            disp('vanishing point is');
            disp(canvas.vanishingPt2);
            disp('to compute another vanishing points');
            canvas.numPt = 0;
            canvas.pt=[];
            mode = 'v3'; % another vanishing point
        end
        
        elseif strcmp(mode,'v3') == 1
        canvas=drawPoint(canvas);
        if canvas.numPt == maxPt
            canvas.vanishingPt3 = calculateVanish(canvas.pt);
            disp('vanishing point is');
            disp(canvas.vanishingPt3);
            disp('Set origin');
            canvas.numPt = 0;
            canvas.pt=[];
            mode = 'o'; % another vanishing point
        end
        
        elseif strcmp(mode,'o') == 1
            canvas.origin = setOrigin();
            disp('origin is');
            disp(canvas.origin);
            canvas.numPt = 0;
            canvas.pt=[];
            mode = 'f'; % compute matrix H1
            
            save('canvas.mat','canvas');
            
         
        end
    end
end