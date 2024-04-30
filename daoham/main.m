hx = 0.01; hy = 0.01; Nx = 4/hx+1; Ny = 2/hy+1;
X0 = -1.99; Y0 = -1.99;
FXY = @(x,y) x.*x.*y - 2.*y;
FXcx = @(x,y)2.*x.*y;
FYcx = @(x,y)x.*x - 2;
% Tinh gia tri ham F
for i=1:Nx
      for j=1:Ny
       FF(i,j) = feval(FXY,X0+i*hx,Y0+j*hy);
      end
end
% Tinh dao ham chinh xac
for i=1:Nx
      for j=1:Ny
            DFXcx(i,j) = feval(FXcx, X0+i*hx,Y0+j*hy);
            DFYcx(i,j) = feval(FYcx, X0+i*hx,Y0+j*hy);
   end
end
% Tinh gan dung dung ham theo x
for i=1:Nx
for j=1:Ny
            if (i==1)
                   DFXgd(i,j) = (FF(i+1,j)-FF(i,j))/hx;
            elseif (i==Nx)
                   DFXgd(i,j) = (FF(i,j)-FF(i-1,j))/hx;
            else
                   DFXgd(i,j) = (FF(i+1,j)-FF(i-1,j))/(2*hx);
            end
      end
end
% Tinh gan dung dung ham theo y
for i=1:Nx
      for j=1:Ny
             if (j==1)
                   DFYgd(i,j) = (FF(i,j+1)-FF(i,j))/hy;
            elseif (j==Ny)
                   DFYgd(i,j) = (FF(i,j)-FF(i,j-1))/hy;
            else
                   DFYgd(i,j) = (FF(i,j+1)-FF(i,j-1))/(2*hy);
            end
   end
  end
% Tinh sai so dao ham
for i=1:Nx
      for j=1:Ny
            SaiSoDFX(i,j) = DFXcx(i,j) - DFXgd(i,j);
            SaiSoDFY(i,j) = DFYcx(i,j) - DFYgd(i,j);
   end
end
image(SaiSoDFX);
SaiSoDFX
