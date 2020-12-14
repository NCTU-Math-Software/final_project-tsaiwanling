function draw(land,D)                             %draw the whole bomb map
    for xx=2:D-1
        for yy=2:D-1
            if and(land(xx,yy,1)==10,land(xx,yy,2)~=3)
                plot(xx-0.5,yy-0.5,'ro','LineWidth',1.6);
            end
            if and(land(xx,yy,1)~=10,land(xx,yy,2)==3)
                plot(xx-0.5,yy-0.5,'kx','Markersize',15,'LineWidth',1.6);
            end
            if and(land(xx,yy,1)~=10,land(xx,yy,2)==0)
                but(xx,yy)
                text(xx-0.5,yy-0.5,num2str(land(xx,yy,1)),'Color',[77 77 77]/255);
            end
        end
    end
end