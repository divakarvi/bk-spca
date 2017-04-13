      subroutine leibniz(seq, len)
      double precision seq(*) 
      integer len
      integer i
      do 10 i=1,len,1
         if(i .eq. 1) then
            seq(i) = 4.0
         elseif(mod(i,2) .eq. 0) then
            seq(i) = seq(i-1) - 4.0D0/(2*i-1)
         else
            seq(i) = seq(i-1) + 4.0D0/(2*i-1)
         endif
 10   continue
      return
      end
     
      program main
      double precision seq1(13), seq2(11)
      integer n, i, j, len
      len = 13
      n = len/2
      if(mod(len,2) .eq. 0) then
         n = n-1
      endif
      call leibniz(seq1, len)
      do 50 i=1,n, 1
        call printseq(seq1, len-2*i+2)
        call aitken(seq1, seq2, len-2*i+2)
        do 60 j = 1, len-2*i, 1
           seq1(j) = seq2(j)
 60     continue
 50   continue
      
      if(mod(len,2) .eq. 0) then
         call printseq(seq1, 2)
      else
         call printseq(seq1, 1)
      endif
      
      end

