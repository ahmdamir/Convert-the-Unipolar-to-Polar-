%UNRZ to PNRZ project
clc;
close all; 
 
    
    subplot(3,1,1)          %display the first graph
    
      bits = [ 1 0 0 1 0 1 1 0 1 0 ] ;                       %generation of the bits assume we have 10 bits  
      bits(end+1)=1;                                         %another method to generate random bits >>> %randi([0 1 ],1 , 10)%
                        
                                %UNIPOLAR SIGNAL%
      
    for i =1  : 10
         if (bits(i) == 1 )      
             if(bits(i+1)==1)                            % the condition of current bit is 1 and next bit is 1 
                   t= i-1: 0.001 :i ;
                   y=ones(1,1001);                       % all y is ones because the next bit is one 
                   plot(t,y,'r')
                   
                   hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('UNRZ'); axis ([0 10 0 2 ]); 
            
             else                                        % the condition of current bit is 1 and next bit is 0      
                 t= i-1: 0.001 :i ;
                 y=ones(1,1001);y(1001)=0;               % the end of y is because the next bit is 0  
                 plot(t,y,'r')
                 hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('UNRZ'); axis ([0 10 0 2 ]);
             end
         end
         
         if(bits(i)==0)
              if(bits(i+1)==0)                            % the condition of current bit is 0 and next bit is 0 
                      t= i-1: 0.001 :i ;
                      y=zeros(1,1001);                    % all y is zeros because the next bit is 0
                      plot(t,y,'b')
                      hold on ; grid on ; title('UNRZ'); xlabel('time'); ylabel('Amplitude'); axis ([0 10 0 2 ]);
                      
             else
                      t= i-1: 0.001 :i ;                   % the condition of current bit is 0 and next bit is 1
                      y=zeros(1,1001);y(1001)=1;           % the end of y is because the next bit is 1
                      plot(t,y,'b')
                      hold on ; grid on ; title('UNRZ'); xlabel('time'); ylabel('Amplitude');  axis ([0 10 0 2 ]);
                     
              end
         end
    end
                                                
    
    
                                                % CONVERT UNIPLOAR TO POLAR % 
                                                
   subplot(3,1,2)   %display the second graph
   encoder= 1 : 10 ;
   for i=1 : 10                                              
       if bits(i)==0 
           encoder(i)=-1 ;
       else
           encoder(i)=1;
       end
      
      
   end          
   encoder(11)=1;
   disp(encoder);
   
   
                                                %POLAR SIGNAL%
    for i=1 : 10 
        if (encoder(i) == 1 )
             if(encoder(i+1)==1)                                %here we generate pulse for the bit 1 and the next bit is 1 
                   t= i-1: 0.001 :i ;
                   y=ones(1,1001);  
                   plot(t,y,'r')
                   hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('PNRZ'); axis ([0 10 -2 2 ]); 
               
                                                  
             else                                               %here we generate pulse for the bit 1 and the next bit is -1                        
                 t= i-1: 0.001 :i ;
                 y=ones(1,1001);y(1001)=-1;
                 plot(t,y,'r')
                 hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('PNRZ'); axis ([0 10 -2 2 ]);
             end
        end
      
        if(encoder(i)==-1)
              if(encoder(i+1)==-1)                              %here we generate pulse for the bit -1 and the next bit is -1
                      t= i-1: 0.001 :i ;
                      y=-ones(1,1001);
                      plot(t,y,'b')
                      hold on ; grid on ; title('PNRZ'); xlabel('time'); ylabel('Amplitude'); axis ([0 10 -2 2 ]);
                      
              else                                               %here we generate pulse for the bit -1 and the next bit is 1
                      t= i-1: 0.001 :i ;
                      y=-ones(1,1001);y(1001)=1;
                      plot(t,y,'b')
                      hold on ; grid on ; title('PNRZ'); xlabel('time'); ylabel('Amplitude'); axis ([0 10 -2 2 ]);
                      
              end
        end
    end
    (yline(0)); hold on;
    
    
    
                                               %CONVERT PLOAR TO UNIPOLAR%
                                                
    decoder= 1 : 10 ;
    for i=1 : 10 
       if encoder(i)==-1 
           decoder(i)=0 ;
       else
           decoder(i)=1;
       end
      
    end
    decoder(11)=1;
    disp(decoder);
    subplot(3,1,3)     %display the third graph 
    
    
    
                                      % RETURN THE ORIGINAL SIGNAL %
   for i =1 : 10 
         if (decoder(i) == 1 )
             if(decoder(i+1)==1)
                   t= i-1: 0.001 :i ;
                   y=ones(1,1001);  
                   plot(t,y,'r')
                   
                   hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('UNRZ'); axis ([0 10 0 2 ]); 
             else                
                 t= i-1: 0.001 :i ;
                 y=ones(1,1001);y(1001)=0;
                 plot(t,y,'r')
                 hold on; grid on ;  xlabel('time'); ylabel('Amplitude');title('UNRZ'); axis ([0 10 0 2 ]);
             end
         end
         
         if(decoder(i)==0)
              if(decoder(i+1)==0)
                      t= i-1: 0.001 :i ;
                      y=zeros(1,1001);
                      plot(t,y,'b')
                      hold on ; grid on ; title('UNRZ'); xlabel('time'); ylabel('Amplitude'); axis ([0 10 0 2 ]);
                      
             else
                      t= i-1: 0.001 :i ;
                      y=zeros(1,1001);y(1001)=1;
                      plot(t,y,'b')
                      hold on ; grid on ; title('UNRZ'); xlabel('time'); ylabel('Amplitude');  axis ([0 10 0 2 ]);
                     
              end
         end
    end
   