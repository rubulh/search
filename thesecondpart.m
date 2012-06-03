H=[ 1 1 0 1 0 0; 1 1 1 0 0 1 ; 0 1 1 0 1 0 ]
the_indicator_matrix=zeros(3,6);
the_codeword=[0 1 1 1 0 1];

for i=1:3
    i_row_ones= find(H(i,:));
    %find all the connections in to the checknode i
    the_i_row_xor=0;
    for k=1:numel(i_row_ones)
        the_i_row_xor=xor(the_i_row_xor,the_codeword(i_row_ones(k)));
    end
   for j=1:numel(i_row_ones)
        the_indicator_matrix(i,i_row_ones(j))=xor(the_i_row_xor,the_codeword(i_row_ones(j)));
   end
end
    the_indicator_matrix
    %everything okay upto here
    
for i=1:6
    i_i_row_ones=find(H(:,i));
    %this gives all the connections to a ith variable node
    the_sum_of_the_ones=0;
    
    for j=1:numel(i_i_row_ones)
        the_sum_of_the_ones=the_sum_of_the_ones+the_indicator_matrix(i_i_row_ones(j),i);
    end
    if(rem(numel(i_i_row_ones),2)==0)
         if((int8(numel(i_i_row_ones)/2))<the_sum_of_the_ones)
             the_codeword(i)=1;
         end
         if((int8(numel(i_i_row_ones)/2))>the_sum_of_the_ones)
             the_codeword(i)=0;
         end
    end
    
   
    if(rem(numel(i_i_row_ones),2)==1)
         if((int8(numel(i_i_row_ones)/2)-1)<the_sum_of_the_ones)
             the_codeword(i)=1;
         end
         if((int8(numel(i_i_row_ones)/2)-1)>=the_sum_of_the_ones)
             the_codeword(i)=0;
         end
    end
end
the_codeword
