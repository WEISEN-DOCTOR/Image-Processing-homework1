function [img] = generateFigure(imgW ,imgH )
%初始化
img = zeros(imgH,imgW,3);
img = uint8(img);
img(:,:,1)=255;
img(:,:,2)=255;
img(:,:,3)=255;
% 生成x的-pi - pi数据
true_x=-pi:2*pi/(imgW-1):pi;
% 计算相应的y
true_red_y=sin(true_x);
true_green_y=cos(true_x);
true_blue_y=true_x.^2;
% 把x映射到图片对应的宽
x=int32(true_x/2/pi*imgW+imgW/2);
% 把y映射到图片对应的高
red_y=int32(imgH/4*3-round(true_red_y*imgH/4/pi/pi));
green_y=int32(imgH/4*3-round(true_green_y*imgH/4/pi/pi));
blue_y=int32(imgH/4*3-round(true_blue_y*imgH/4/pi/pi));
% 遍历数据渲染图片
for i=1:imgW
    if x(i)==0
        x(i)=x(i)+1;
    end
    if red_y(i)>0 && red_y(i)<=imgH
        img(red_y(i),x(i),2)=0;
        img(red_y(i),x(i),3)=0;
    end
    if green_y(i)>0 && green_y(i)<=imgH
        img(green_y(i),x(i),3)=0;
        img(green_y(i),x(i),1)=0;
    end
    if blue_y(i)>0 && blue_y(i)<=imgH
        img(blue_y(i),x(i),1)=0;
        img(blue_y(i),x(i),2)=0;
    end
end
% 绘制黑色坐标轴
img(:,imgW/2,:)=0;
img(round(imgH/4*3),:,:)=0;
% 展示图片
imshow(img);
end