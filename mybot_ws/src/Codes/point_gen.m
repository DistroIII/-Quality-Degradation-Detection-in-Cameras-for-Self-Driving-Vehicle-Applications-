function [Chi_hat,dt]=point_gen(Chi,A,B,C,xmin,xmax,ymin,ymax,v,dt,index,fac)

% dt_half=dt/2;
for i=1:1
        %generates new dynamic and robot entries based on current and half the time step
        Chi;
        index;
        [x,y,z,X,Y] = arnold_RK4(A,B,C,v,Chi(i,1),Chi(i,2),Chi(i,3),Chi(i,4),Chi(i,5),dt,index);
%         [x_half,y_half,z_half,X_half,Y_half] = arnold_RK4(A,B,C,v,Chi(i,1),Chi(i,2),Chi(i,3),Chi(i,4),Chi(i,5),dt_half,index);
%         %compares whether the robot entries associated with half or current
%         %step size is more accurate
%         if abs(X-X_half)/dt > epsilon | abs(Y-Y_half)/dt > epsilon
%             %in this case, the robot entries assoiated with current step
%             %size is not accurate and assigns new entries associated with
%             %half step size to the vector IC_vec
%             dt = dt_half;
%             Chi_hat(i,1) = x_half;Chi_hat(i,2) = y_half;Chi_hat(i,3) = z_half;
%             Chi_hat(i,4) = X_half;Chi_hat(i,5) = Y_half;
%         else
            %in this case, the robot entries assoiated with current step
            %size is accurate and assigns new entries associated with
            %current step size to the vector IC_vec
            Chi_hat(i,1) = x; Chi_hat(i,2) = y; Chi_hat(i,3) = z;
            Chi_hat(i,4) = X;Chi_hat(i,5) = Y;
%         end
%          XI_prev=IC_vec(i,4);
%         YI_prev=IC_vec(i,5);
%        XI=IC_vec(i+1,4);
%         YI=IC_vec(i+1,5);
%         if XI>50 | YI>50
%             'error'
%         end
i;
   Chi(i,4:5) ;
   Chi_hat(i,4:5)  ;   
        %if the points are out of bounds, BoundAvoid function will map those
        %points in bounds
%         [Chi_hat(end,4),Chi_hat(end,5)] = BoundAvoid(Chi_hat(end,4),Chi_hat(end,5),xmin,xmax,ymin,ymax,v,dt,Chi(end,4),Chi(end,5),fac);
%         [Chi_hat(end,4),Chi_hat(end,5),index,Chi_hat(end,1),Chi_hat(end,2),Chi_hat(end,3)] = BoundAvoid(Chi_hat(end,4),Chi_hat(end,5),xmin,xmax,ymin,ymax,v,dt,Chi(end,4),Chi(end,5),fac,index,Chi_hat(end,1),Chi_hat(end,2),Chi_hat(end,3));

%         V1(i)=sqrt((IC_vec(i+1,4)-IC_vec(i,4))^2+(IC_vec(i+1,5)-IC_vec(i,5))^2)/dt;
%         DT(i)=dt;
%         i_ind(i)=i;
        %All of the dynamic and robot coordinates must not have NaN or infinity values
        for j = 1:size(Chi_hat,2)
            if isnan(Chi_hat(i,j)) | isinf(Chi_hat(i,j))
            error('Cannot have NaN or Inf values')
            end
        end
        
end
%            %If the robot's coordinates are still out of bounds after using the Mirror
%     %Map technique, the code will stop executing. Robot's coordinates must
%     %lie within bounds
%     for i = 1:length(IC_vec)
%         if IC_vec(i,4) < xmin || IC_vec(i,5) < ymin || IC_vec(i,4) > xmax || IC_vec(i,5) > ymax
%             error('Coordinates are out of bounds')
%         end
%     end