clc,clear;
main();

function main

    [X,Y] = meshgrid(-10:.5:10);
	%Función de entrada
    R = sqrt(X.^2 + Y.^2) + eps;
    Z = sin(R)./R;
	%Plado 2d
    mesh(X,Y,Z)
    axis tight; hold on;

    individuos=10;
    maximizar=0;
    P0x=random('unif',-1,1,individuos,1);
    P0y=random('unif',-1,1,individuos,1);

    for i=1:15
    %fitness
        fi=e_funcion(P0x,P0y);
    disp(fi);
    %padres - Algoritmo de seleccion
        PAx=Torneo(fi,P0x,individuos,maximizar);
        PAy=Ranking(fi,P0y,individuos,maximizar);
    
    %Hijos - cruce entre padres
    if(i==i)
        Hix=Cruce(PAx,individuos);
        Hiy=Cruce(PAy,individuos);
    elseif(random('unif',-1,1,individuos,1)<0.7)
        Hix=Cruce(PAx,individuos);
        Hiy=Cruce(PAy,individuos);
    end

    %Hijos - mutacion
    if(random('unif',-1,1,individuos,1)<0.2)
        Hix=Mutacion(Hix);
        Hiy=Mutacion(Hiy);
    end
        
    %Reemplazo generacional
        P0x=Hix;
        P0y=Hiy;
        
    %Graficar
        plot3(P0x,P0y,fi,'.');
        
    end
    drawnow();
    pause(0.1);
end

function Hijos = Mutacion(P0)
    pos=randi(length(P0),1,1);
    alazar=P0(pos); 
    newIndividuo = alazar+random('norm',0,1);
    P0(pos)=newIndividuo;
    Hijos = P0;
end


function Hijos = Cruce(P0,individuos)
    %algoritmo cruce
    alfa = random('unif',-1,1,individuos,1);
    negAlfa = 1.0 - alfa;
    padre = P0(randi(length(P0),1,1));
    madre = P0(randi(length(P0),1,1));
    Hijos = alfa*padre+negAlfa*madre;
end


function res = e_funcion(x,y)
    r = sqrt(x.^2+y.^2) + eps;
    res = sin(r)./r;
end

function Seleccion=Ranking(fi,P0,individuos,Orden)
    fi=zscore(fi)+3;
    ma=[fi,P0];
    ma=sortrows(ma,-1);
    L=size(ma);
    fi=ma(:,1);
    P0=ma(:,2:1:L(2));
    if (Orden>0)
        fi=1./fi;
        Prob=fi/sum(fi);
    else
        Prob=fi/sum(fi);
    end
    for i=1:individuos
        x=gprnd(0.4,0.3,0.1);
        if x>=0.99
            x=0.99;
        end
        a=0;
        for j=1:individuos
            a=Prob(j)+a;
            if x<a
                P(i,:)=P0(j,:);
                break;
            end  
        end
    end
    Seleccion=P;
end

function Seleccion=Torneo(fi,P0,individuos,Orden)
    fi=zscore(fi)+3;
    %Primer Par
    for ind=1:individuos
        for i=1:2
            pos=fix(random('unif',1,individuos,1,1));
            A(i,:)=fi(pos,:);
            B(i,:)=P0(pos,:);
        end
        %Segundo Par
        for i=1:2
            pos=fix(random('unif',1,individuos,1,1));
            C(i,:)=fi(pos,:);
            D(i,:)=P0(pos,:);
        end    
        %Semifinal
        for i=1:2
            r=random('unif',0,1,1,1);
            if i==1
                aux_fi=A;
            else
                aux_fi=C;
            end
            if (Orden>0)
                aux_fi=1./aux_fi;
                Prob=aux_fi/sum(aux_fi);
            else
                Prob=aux_fi/sum(aux_fi);
            end    
            if i==1
                if(r<Prob(1))
                    E(1,:)=A(1,:);
                    F(1,:)=B(1,:);
                else
                    E(1,:)=A(2,:);
                    F(1,:)=B(2,:);
                end
            else
                if(r<Prob(1))
                    E(2,:)=C(1,:);
                    F(2,:)=D(1,:);
                else
                    E(2,:)=C(2,:);
                    F(2,:)=D(2,:);
                end            
            end
        end     
        %Final
        Aux_Seleccion=Ruleta(E,F,2,Orden);
        P(ind,:)=Aux_Seleccion(1,:);
    end
    Seleccion=P;
end

function Seleccion=Ruleta(fi,P0,individuos,Orden)
    fi=zscore(fi)+3;
    if (Orden>0)
        fi=1./fi;
        Prob=fi/sum(fi);
    else
        Prob=fi/sum(fi);
    end
    for i=1:individuos
        x=random('unif',0,1,1,1);
        a=0;
        for j=1:individuos
            a=Prob(j)+a;
            if x<a
                P(i,:)=P0(j,:);
                break;
            end  
        end
    end
    Seleccion=P;
end
