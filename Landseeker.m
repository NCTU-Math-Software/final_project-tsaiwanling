function main(v)
%input: 1:easy
%       2:middle
%       3:difficult
%click left mouse to open the square and click right mouse to put or get rid of the flag
%click middle mouse on the opened square and open the rest square if the
%numbers of nearing flags equals to the number on the clicked square
%if you open the bomb then the game over
    set(0,'defaultfigurecolor','w');screensize=get(0,'ScreenSize');
    switch v
        case 1
            D=11;B=10;
            figure('Name','Landmine','outerposition',[(screensize(3)-700)/2 (screensize(4)-700)/2 700 700]);
            set (gca,'position',[0.001,0.001,0.9999,0.9999]),axis([0 D 0 D]);axis square;axis off;hold on;
        case 2
            D=18;B=40;
            figure('Name','Landmine','outerposition',[(screensize(3)-800)/2 (screensize(4)-800)/2 800 800]);
            set (gca,'position',[0.001,0.001,0.9999,0.9999]),axis([0 D 0 D]);axis square;axis off;hold on;
        case 3
            D=26;B=99;
            figure('Name','Landmine','outerposition',[(screensize(3)-800)/2 (screensize(4)-800)/2 800 800]);
            set (gca,'position',[0.001,0.001,0.9999,0.9999]),axis([0 D 0 D]);axis square;axis off;hold on;
    end
    q=0;hp=[];flagX=[];flagY=[];                            %D is the board size,the rest are all for record the flag
    for ii=1:D-1                                            %draw the board
        plot([1 1]*ii,[1 D-1],'Color',[77 77 77]/255);hold on;     
        plot([1 D-1],[1 1]*ii,'Color',[77 77 77]/255);hold on;
    end
    map=zeros(D);                                           %the board with recording the bomb and the numbers
    open=zeros(D);                                          %the board with recording if the square are opened
    xx=0;yy=0;                                              %the first click to start the game
    plot(D/2-0.5,D-0.5,'r>','MarkerSize',15,'LineWidth',1.6);d=number_of_flag(cat(3,map,open),D,B);
    st=text(D/3,D/2,'Start!','FontSize',45,'Color','g');pause(1.5);delete(st);
    while xx<1 || yy<1 || xx>D-1 || yy>D-1 || b~=1
        [xx,yy,b]=ginput(1);
    end                        
    %line 38-53:construct the bomb map,which make sure that the first click must be the zero(the numbers of the nearing bomb) 
    xx=ceil(xx);yy=ceil(yy);                    
    bombx=[xx xx-1 xx-1 xx-1 xx xx xx+1 xx+1 xx+1]; 
    bomby=[yy yy-1 yy yy+1 yy-1 yy+1 yy-1 yy yy+1];
    for jj=1:B
        [x,y]=bomb(jj+8,bombx,bomby,D);
        bombx=[bombx x];bomby=[bomby y];
        map(x,y)=10;
    end
    bombx(:,1:9)=[];bomby(:,1:9)=[];
    for ax=2:D-1
        for ay=2:D-1
            t=check_bomb_number(ax,ay,map);
            map(ax,ay)=t;
        end
    end
    land=cat(3,map,open);                                   %combine the board,one is recording the map another is recording opened or not
    %line 56-65:since the first click make sure that number is zero,we need to open
    %the square need to be opened
    land=white(xx,yy,land,D);                               %collect the square need to be opened            
    for ax=2:D-1                                            %write the numbers of bomb
        for ay=2:D-1
            if land(ax,ay,2)==1
                but(ax,ay)
                text(ax-0.5,ay-0.5,num2str(land(ax,ay,1)),'Color',number_color(ax,ay,land))
                land(ax,ay,2)=land(ax,ay,2)+1;
            end
        end
    end
    while 1                                                 %gaming!!
        x=0;y=0;
        while x<1 || y<1 || x>D-1 || y>D-1
            [x,y,b]=ginput(1);
        end
        x=ceil(x);y=ceil(y);
        if b==1                                             %left click
            if and(map(x,y)==10,land(x,y,2)==0)             %if click the bomb
                draw(land,D);                               %draw the all bomb map
                plot(x-0.5,y-0.5,'ro','MarkerSize',15,'LineWidth',1.6)
                text(D/3,D/2,'You bomb!','FontSize',45,'Color','r');pause(1.5);
                YN
                return;                                     %stop the game
            end
            if map(x,y)==0                                  %if click the zero
                land=white(x,y,land,D);
                for ax=2:D-1
                    for ay=2:D-1
                        if land(ax,ay,2)==1
                            but(ax,ay);
                            text(ax-0.5,ay-0.5,num2str(land(ax,ay,1)),'Color',number_color(ax,ay,land))
                            land(ax,ay,2)=2;
                        end
                    end
                end
            else                                            %if click not both bomb and zero
                if land(x,y,2)==0
                    land(x,y,2)=1;                          %recording opened
                    but(x,y)
                    text(x-0.5,y-0.5,num2str(map(x,y)),'Color',number_color(x,y,land));%write!
                    land(x,y,2)=2;
                end
            end
        end
        if b==2                                             %click middle mouse
            if land(x,y,2)==2
                t=0;
                X=[x x-1 x-1 x-1 x x x+1 x+1 x+1];
                Y=[y y-1 y y+1 y-1 y+1 y-1 y y+1];
                for ii=1:9
                    if land(X(ii),Y(ii),2)==3               %calculate the flag arounding the square
                          t=t+1;
                    end
                end
                if land(x,y,1)==t                           %if the number equals to the the numbers of flags
                    for ii=1:9
                        if X(ii)>1&&X(ii)<D&&Y(ii)>1&&Y(ii)<D
                            if and(land(X(ii),Y(ii),2)==0,land(X(ii),Y(ii),1)~=0)           %not open and not zero
                                land(X(ii),Y(ii),2)=1;
                                if land(X(ii),Y(ii),1)~=10
                                    but(X(ii),Y(ii));
                                    text(X(ii)-0.5,Y(ii)-0.5,num2str(land(X(ii),Y(ii),1)),'Color',number_color(X(ii),Y(ii),land))
                                end
                                land(X(ii),Y(ii),2)=2;
                            end
                            if and(land(X(ii),Y(ii),2)==0,land(X(ii),Y(ii),1)==0)           %not open but zero
                                land=white(X(ii),Y(ii),land,D);
                                for ax=2:D-1
                                    for ay=2:D-1
                                        if land(ax,ay,2)==1
                                            but(ax,ay);
                                            text(ax-0.5,ay-0.5,num2str(land(ax,ay,1)),'Color',number_color(ax,ay,land))
                                            land(ax,ay,2)=land(ax,ay,2)+1;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                game_over_or_not(land);
            end
        end
        if b==3                                                                             %click right
            if land(x,y,2)==0                                                               %if not yet put the flag
                q=q+1;land(x,y,2)=3;
                hp(q)=plot(x-0.5,y-0.5,'r>','LineWidth',1.6);                               %put the flag
                flagX=[flagX x];flagY=[flagY y];
            elseif  land(x,y,2)==3                                                          %if had put the flag
                for ii=1:length(flagX)
                    if and(x==flagX(ii),y==flagY(ii))
                        qn=ii;
                    end
                end
                delete(hp(qn))                                                              %get rid of the flag
                flagX(:,qn)=[];flagY(:,qn)=[];
                hp(:,qn)=[];q=q-1;land(x,y,2)=0;
            end
        end
        if b==97
            text(D/3,D/2,'Bye Bye','FontSize',50,'Color','r');pause(1.5);close all
            return;
        end
        delete(d);
        d=number_of_flag(land,D,B);
        s=end_or_not(land);
        if s==(D-2)^2-B
            text(D/3,D/2,'Success!','FontSize',50,'Color','r');pause(1.5);
            YN
            return;
        end
    end
end