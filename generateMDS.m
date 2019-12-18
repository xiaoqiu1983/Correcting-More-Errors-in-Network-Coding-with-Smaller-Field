%generate a MDS matrix in a finite field

function M = generateMDS(m_nK1,m_nN1,nFieldSize )

if (m_nK1 == 0)

   
		fprintf('Invalid K');
        
	
end


if (m_nN1 < m_nK1)

   
		fprintf('Please ensure that N is greater than K!');
        
	
end

nMaxN = nFieldSize + 1;
% fprintf('%d', nMaxN);

bq2 = 1;
 

if ((m_nK1 == 3) ||(m_nK1 == (nFieldSize - 1)))

	
     	nMaxN = (nFieldSize + 2);

% 		fprintf('%d', nMaxN);
        
		bq2 = 1;

	    
end


if (m_nN1 > nMaxN)
    
   fprintf('Error. According to MDS conjecture, the maximal N is');
   
end


     nRow = m_nN1;

	 nCol = m_nK1;
     
     
     
for  i = 1:m_nN1
	
		for j = 1:m_nK1
		
			G(i,j) = 0;
		
        end
end



if (m_nN1 >= nFieldSize)

		for i=1:nFieldSize

		    for j=1:m_nK1

			G(i,j) = mod(i^(j-1),nFieldSize);

            end
           
        end
end        
 


        
if  (m_nN1 < nFieldSize)

	

		for i = 1:m_nN1

		    for j = 1:m_nK1

			G(i,j) = mod(i^(j-1),nFieldSize);

            end
        end
        
        
end



if (m_nN1 == nFieldSize + 1)

	

		G(nFieldSize+1,nCol) = 1;

	
end




if    m_nN1 == nFieldSize + 2


		G(nFieldSize+1,nCol - 1) = 1;

		G(nFieldSize + +2,nCol) = 1;
    
 end		

	
M=G;

end

