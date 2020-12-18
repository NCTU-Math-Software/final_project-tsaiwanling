# 踩地雷

**Downlond 踩地雷.zip and unzip it  
Please execute the landseek.m in commond window    
Choose the version which u want**
| 難度 | 規格 |
|:--------:|:---------------:|
| 簡單 | 9x9 10個地雷 | 
| 普通 | 16x16 40個地雷 | 
| 困難 | 24x24 99個地雷| 
## 遊玩說明
| 按鍵 | 功能 |
|:--------:|:---------------:|
| 左鍵 | 開啟空格，或是你想結束遊戲就自己按炸彈:) | 
| 右鍵 | 點擊一次立旗子，立過旗子就拔掉 | 
| 中鍵 | 周圍旗子數量等於該格數字，開啟剩餘周圍空格 |
| a | 強制關閉遊戲 |  

遊戲結束時會跳出對話框邀請你再玩一次ˊˇˋ
## Two GUI Project
#### landseek.m
遊戲開始的畫面
#### YN.m
是否在玩一次
## Main Project - Landseeker  
先建構一個DxDx2的矩陣
第一層DxD存炸彈數字,第二層DxD紀錄開啟與否
此概念和同學0712216討論而來
之後即利用subproject完成遊戲
## Subproject
#### bomb.m
` [x,y]=bomb(n,A,B,D) `  
*想法主要是隨機生成x&y,透過逐一檢查是否和A&B有相同的數對決定是否重新生成(遞迴)*
>* 此function目的為製造所有炸彈的座標  
>> x,y是收集地雷的座標  
A,B是收集所有地雷的集合,n同時為集合大小  
D是生成地雷座標的bounding(棋盤大小)  

#### end_or_not.m
` s=end_or_not(land) `  
**當s=總方格數-地雷數，遊戲成功並結束**
>* 此function目的為檢測是否完成踩地雷(用在單擊滑鼠任意功能時之後，每次單擊完檢查)  
>> s為開啟過的方格數量  
land記錄整個棋盤的炸彈位置、鄰近炸彈數及開啟與否，利用D*D*2的矩陣紀錄
#### check_bomb_number.m
` t=check_bomb_number(xx,yy,map) `  
**令X，Y為(xx,yy)周遭八格的座標，並逐一檢查是否有地雷(if map(X,Y)==10)**
>* 此function目的為計算沒有地雷的方格鄰近有幾顆地雷(最多8顆最少0顆)  
>> t為鄰近炸彈數量  
xx,yy為矩陣上的位置(或是滑鼠單擊的位置)，map為矩陣用來紀錄鄰近地雷數及地雷位置(land=cat(2,map,open))，定義地雷位置的地雷數為10  
*後面參數意義同前面定義*
#### draw.m
` draw(land,D) `  
**開到炸彈時，畫出全部的答案**
>* 此function目的是將所有空格開啟並畫出炸彈位置
#### white.m
` land=white(xx,yy,land,D) `
**開啟空白和他鄰近的位置**
#### but.m
` but(x,y) `
**將開啟的空格給他一個漂亮的底色:)**
#### number_color.m
` s=number_color(ax,ay,land) ` 
**將數字顏色分類**
#### game_over_or_not.m
 ` game_over_or_not(land) `
**判定遊戲是否因踩到炸彈而結束**
