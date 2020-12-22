function s=number_color(x,y,land)
    if land(x,y,1)==0
        s=[255 219 237]/255;
    elseif land(x,y,1)==1
        s='b';
    elseif land(x,y,1)==2
        s=[0, 168, 0]/255;
    elseif land(x,y,1)==3
        s='r';
    elseif land(x,y,1)==4
        s=[144, 26, 255]/255;
    elseif land(x,y,1)==5
        s=[199, 162, 0]/255;
    elseif land(x,y,1)==6
        s='c';
    elseif land(x,y,1)==7
        s='k';
    elseif land(x,y,1)==8
        s=[77 77 77]/255;
    end
end