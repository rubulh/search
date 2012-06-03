H=[ 1 1 0 1 0 0; 1 1 1 0 0 1 ; 0 1 1 0 1 0 ]
h_size=size(H);
the_codeword=[0 1 1 1 0 1]
the_cross_over_probability=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
errors=zeros(numel(the_cross_over_probability));
'next is tcop looping'
for tcop=1:numel(the_cross_over_probability)
    '************************START*******************************'
    tcop
    the_bsc_codeword=bsc(the_codeword,the_cross_over_probability(tcop));
    the_bsc_codeword
    the_final_codeword=the_bsc_codeword;

    the_indicator_matrix=zeros(h_size(1),h_size(2));

    for i=1:h_size(1)
        i_row_ones= find(H(i,:));
        %find all the connections in to the checknode i
        the_i_row_xor=0;
        for k=1:numel(i_row_ones)
            the_i_row_xor=xor(the_i_row_xor,the_bsc_codeword(i_row_ones(k)));
        end
        for j=1:numel(i_row_ones)
            the_indicator_matrix(i,i_row_ones(j))=xor(the_i_row_xor,the_bsc_codeword(i_row_ones(j)));
        end
    end
    
    for i=1:h_size(2)
        i_i_row_ones=find(H(:,i));
        the_sum_of_the_ones=0;
        for j=1:numel(i_i_row_ones)
            the_sum_of_the_ones=the_sum_of_the_ones+the_indicator_matrix(i_i_row_ones(j),i);
        end
        if(rem(numel(i_i_row_ones),2)==0)
             if((int8(numel(i_i_row_ones)/2))<the_sum_of_the_ones)
                 the_final_codeword(i)=1;
             end
            if((int8(numel(i_i_row_ones)/2))>the_sum_of_the_ones)
                 the_final_codeword(i)=0;
            end
        end
    
   
        if(rem(numel(i_i_row_ones),2)==1)
             if((int8(numel(i_i_row_ones)/2)-1)<the_sum_of_the_ones)
                 the_final_codeword(i)=1;
             end
            if((int8(numel(i_i_row_ones)/2)-1)>=the_sum_of_the_ones)
                 the_final_codeword(i)=0;
            end
        end
    end
    
    %calculate the number of errors
    for o=1:h_size(2)
        if(the_final_codeword(o)~=the_codeword(o))
            errors(tcop)=errors(tcop)+1;
        end
    end
    the_final_codeword
    errors(tcop)
    '************************END*******************************'
end
plot(the_cross_over_probability,errors)