# final_project-tsaiwanling
final_project-tsaiwanling created by GitHub Classroom

**踩地雷**

Input:
* 1 簡單:9x9 10個地雷
* 2 普通:16x16 40個地雷
* 3 困難:24x24 99個地雷

總共有一個主要程式和六個功能程式

首先介紹六個程式

# 1.function [x,y]=bomb(n,A,B,D)
>* 此function目的為製造所有炸彈的座標  
>> x,y是收集地雷的座標  
>> A,B是收集所有地雷的集合,n同時為集合大小  
>> D是生成地雷座標的bounding(棋盤大小)  
**想法主要是隨機生成x&y,透過逐一檢查是否和A&B有相同的數對決定是否重新生成(遞迴)**
# 2.function s=end_or_not(land)
> 此function目的為檢測是否完成踩地雷(用在單擊滑鼠任意功能時之後，每次單擊完檢查)  
> s為開啟過的方格數量  
> land記錄整個棋盤的炸彈位置、鄰近炸彈數及開啟與否，利用D*D*2的矩陣紀錄
>> 當s=總方格數-地雷數，遊戲成功並結束
# 3.function t=check_bomb_number(xx,yy,map)
> 此function目的為計算沒有地雷的方格鄰近有幾顆地雷(最多8顆最少0顆)  
> t為鄰近炸彈數量  
> xx,yy為矩陣上的位置(或是滑鼠單擊的位置)，map為矩陣用來紀錄鄰近地雷數及地雷位置(land=cat(2,map,open))，定義地雷位置的地雷數為10  
>> 令X，Y為(xx,yy)周遭八格的座標，並逐一檢查是否有地雷(if map(X,Y)==10)
