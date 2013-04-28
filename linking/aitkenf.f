      subroutine aitken(seq1, seq2, len)
      double precision seq1(*), seq2(*)
      integer len
      integer i
      double precision si, sip1, sip2
      do 20 i=1,len-2,1
         si = seq1(i)
         sip1 = seq1(i+1)
         sip2 = seq1(i+2)
         if(si .eq. sip1) then
            seq2(i) = si
         else
            seq2(i) = si - (sip1-si)**2/(sip2-2*sip1+si)
         endif
 20   continue
      return
      end
         
      subroutine printseq(seq, len)
      double precision seq(*)
      integer len
      integer  i
      write(6,*)
      write(6,100) (seq(i), i=1,len,1)
      write(6,*)
 100  format(F12.10)
      return
      end

      double precision function aitkenextrapolate(seq1, seq2, len)
      double precision seq1(*), seq2(*)
      integer len
      integer i, j, n
      n = len/2
      if(mod(len,2) .eq. 0) then
         n = n-1
      endif
      do 30 i=1,n,1
         call aitken(seq1, seq2, len-2*i+2)
         do 40 j=1,len-2*i,1
            seq1(j) = seq2(j)
 40      continue
 30   continue
      if(mod(len,2). eq. 0) then
         aitkenextrapolate = seq1(2)
      else
         aitkenextrapolate = seq1(1)
      endif
      return
      end
