
% my own method to compute the rank of a matrix in a finite field
% 

function nRank=worank(M,nFieldSize)


	% Define a variable to record the position of the main element.
    
    [m,n]=size(M);
    nRow=m;
    nCol=n;
        
    yPos = 1;

	for   i=1:nRow

		% Find the main element which must be non-zero.
		 bFind = false;
		for  x=yPos:nCol
		
			for  k=i:nRow

				if (M(k,x) ~= 0)

				  % Exchange the two vectors.

					for  j=1:nCol
					
						nVal = M(i,j);

						M(i,j) = M(k,j);

						M(k,j) = nVal;

                    end											% We have exchanged the two vectors.	

					bFind = true;

					break;

                end

            end

			if (bFind == true)

				yPos = x;

				break;

            end

        end

      if bFind == true
		for j=i+1:nRow
			
             verse=invprime(M(i,yPos),nFieldSize);
             temp = mod(M(j,yPos) * verse, nFieldSize);

			for z=1:nCol

                mul=mod((temp * M(i,z)),nFieldSize);
                M(j,z) = mod((M(j,z)- mul),nFieldSize);

            end

        end
		
		yPos=yPos+1;
       end
   end


	% The matrix becomes a scalar matrix. we need to make more elements become 0 with elementary transformations.

	yPos = 1;

	for i = 2:nRow
	
		for j = 1:nCol

			if (M(i,j) ~= 0)
		  	% the main element is found.
				yPos = j;
				break;
            end

        end

        if j ==nCol & yPos ==1 
              continue; 
        end
        
		for   k =1:i-1

			
            
             verse=invprime(M(i,yPos),nFieldSize);
             temp = mod(M(k,yPos) * verse, nFieldSize);
            

			   for  z=1:nCol

                mul=mod((temp * M(i,z)),nFieldSize);
                M(k,z) = mod((M(k,z)- mul),nFieldSize);
                

                end

       end


				
                                               
  end



	 nRank = 0;

	% Get the rank.
for  i =1:nRow

		nNonzero = 0;

		for j=1:nCol
	
			if (M(i,j) ~= 0)

				nNonzero=nNonzero+1;

            end

        end

		% If there is only one nonzero element in the new matrix, it is concluded an original packet is leaked. 

		if (nNonzero > 0)

			% Leaked.

			nRank=nRank+1;

        end
            
end



end



