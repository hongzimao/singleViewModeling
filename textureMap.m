function textureMap(img, H, pos, mode)
pos = reshape(pos, 2, 4)'; % 4 points on images
minpos = min(pos);
il = minpos(1);
jl = minpos(2);
maxpos = max(pos);
ih = maxpos(1);
jh = maxpos(2);
texture = zeros(ih-il+1, jh-jl+1, 3);
for i = il:ih
   for j = jl:jh
       mapback = H\[i, j, 1]';
       mapback = mapback/mapback(3);
       round = floor(mapback);
       x = round(1);
       y = round(2);
       a = mapback(1) - x;
       b = mapback(2) - y;
       texture(i-il+1, j-jl+1, :) =  (1-a)*(1-b)*img(y, x, :)...
                                   + a*(1-b)*img(y, x+1, :)...
                                   + a*b*img(y+1, x+1, :)...
                                   + b*(1-a)*img(y+1, x, :);
   end
end

if strcmp(mode,'h1') == 1
    figure(2);
    textureout = imrotate(uint8(texture),180);
    imwrite(textureout, 'texture1.bmp');
    imshow(textureout);
    
elseif strcmp(mode,'h2') == 1
    figure(3);
    textureout = imrotate(uint8(texture),90);
    imwrite(textureout, 'texture2.bmp');
    imshow(textureout);
    
else
    figure(4);
    textureout = flipdim(imrotate(uint8(texture),90),2);
    imwrite(textureout, 'texture3.bmp');
    imshow(textureout);
end

end