function game_over_or_not(land)
    D=size(land,1);
    for ii=2:D-1
        for jj=2:D-1
            if and(land(ii,jj,1)==10,land(ii,jj,2)==2)
                draw(land,D);                                                   %draw the all bomb map
                text(D/3,D/2,'You bomb!','FontSize',45,'Color','r');pause(1.5);
                YN
                return;                                                         %stop the game
            end
        end
    end
end