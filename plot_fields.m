X0fig=10; Y0fig=100;
Wfig=1200;Hfig=1000;
Nsp=ceil(sqrt(length(neff)));

if AAbs==1
    HHx=abs(Hx);HHy=abs(Hy);HHz=abs(Hz);
    EEx=abs(Ex);EEy=abs(Ey);EEz=abs(Ez);
end
if RReal==1
    HHx=real(Hx);HHy=real(Hy);HHz=real(Hz);
    EEx=real(Ex);EEy=real(Ey);EEz=real(Ez);
end
if IImag==1
    HHx=imag(Hx);HHy=imag(Hy);HHz=imag(Hz);
    EEx=imag(Ex);EEy=imag(Ey);EEz=imag(Ez);
end


if plotElectricalField==1
    figure('Name','Electrical Field: Ex','position',[X0fig Y0fig Wfig Hfig])
    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=EEx(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Ex)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Ex)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Ex)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar

    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure('Name','Electrical Field: Ey','position',[X0fig Y0fig Wfig Hfig])

    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=EEy(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Ey)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Ey)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Ey)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar

    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure('Name','Electrical Field: Ez','position',[X0fig Y0fig Wfig Hfig])

    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=EEz(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Ez)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Ez)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Ez)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if plotMagneticalField==1
    figure('Name','Magnetical Field: Hx','position',[X0fig Y0fig Wfig Hfig])

    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=HHx(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Hx)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Hx)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Hx)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar

    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure('Name','Magnetical Field: Hy','position',[X0fig Y0fig Wfig Hfig])

    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=HHy(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Hy)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Hy)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Hy)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar

    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    figure('Name','Magnetical Field: Hz','position',[X0fig Y0fig Wfig Hfig])

    for i=1:length(neff)

        subplot(Nsp,Nsp,i)
        hold on
        A=HHz(:,:,i);
        if sum(A(:)==0)
            pcolor(x*1e6,y*1e6,A)
        else
            pcolor(x*1e6,y*1e6,A/max(abs(A(:))))
        end
        contour(x*1e6,y*1e6,abs(n),1,'linewidth',2,'linecolor','w')
        %plot([-1 1]*Dx*1e6,[0 0],'w','linewidth',2)

        if RReal==1 || IImag==1
            caxis([-1 1])
        elseif AAbs==1
            caxis([0 1])
        end

        if AAbs==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Abs(Hz)'  )    )
        elseif RReal==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Re(Hz)'  )    )
        elseif IImag==1
            title(  strcat('neff=',  num2str( neff(i) ,'%.3f'),',  Im(Hz)'  )    )
        end
        shading flat
        xlabel('x (um)')
        ylabel('y (um)')
        colormap(jet)
        colorbar

    end

end