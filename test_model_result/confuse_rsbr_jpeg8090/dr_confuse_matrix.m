function dr_confuse_matrix(mtx)
[sizex,sizey] = size(mtx);
format bank;
A = mtx';
B = (1-A)';
figure(1)
imagesc(B)
colormap(gray)
for i=1:sizex
    for j=1:sizey
        if A(i,j)==max(A(:,j))
            text(i,j,num2str(A(i,j)),'horiz','center','color','w','fontname','Times','fontsize',14);
        else
%             if i == 1 && j == 5
%                 text(1,5,'0.00003','horiz','center');
%             else
                text(i,j,num2str(A(i,j)),'horiz','center','fontname','Times','fontsize',14);
%             end
        end
    end
end
label = {'H0','H1','H2','H3','H4'};
axis on
set(gca,'YAxisLocation','left')    %修改纵坐标的位置
set(gca,'XAxisLocation','top')     %修改横坐标的位置
set(gca, 'XTick',[1:sizex]);         % X轴的记号点
set(gca, 'YTick',[1:sizey]);         % X轴的记号点
set(gca, 'XTicklabel',label(1:sizex));         % X轴的记号点
set(gca, 'YTicklabel',label(1:sizex));         % X轴的记号点
set(gca,'fontname','Times','fontsize',14)
%set(gca,'position',[0 0 1 1])