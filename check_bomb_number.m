function t=check_bomb_number(xx,yy,map)         %A B is bomb bag,the function to record the numbers of nearing bombs
    t=10;
    if map(xx,yy)==10
        return;
    end
    if map(xx+1,yy)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx+1,yy+1)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx+1,yy-1)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx-1,yy)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx-1,yy+1)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx-1,yy-1)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx,yy+1)==10 map(xx,yy)=map(xx,yy)+1; end
    if map(xx,yy-1)==10 map(xx,yy)=map(xx,yy)+1; end
    t=map(xx,yy);
end