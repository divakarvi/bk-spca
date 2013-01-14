      double precision function partialSum(x, n)
      double precision x
      integer n
      double precision prod
      integer i
      partialSum = 0
      prod = 1.0D0
      do 10 i=1,n,1
         prod = prod*x
         if(mod(i,2).eq.0) then
            partialSum = partialSum - prod/i
         else
            partialSum = partialSum + prod/i
         endif
 10   continue
      return
      end
      
      double precision function  extrapolateSum(x, n,
     $     seq1, seq2)
      double precision x, seq1(*), seq2(*)
      integer n
      double precision prod, sum, aitkenextrapolate
      integer i
      prod = 1.0D0
      sum = 0D0
      do 20 i=1,n,1
         prod = prod*x
         if(mod(i,2).eq.0) then
            sum = sum - prod/i
         else
            sum = sum + prod/i
         endif
         seq1(i) = sum
 20   continue
      extrapolateSum = aitkenextrapolate(seq1, seq2, n)
      return
      end

      program main
      double precision xlist(11), seq1(13), seq2(11)
      double precision val1, val2, val3
      double precision partialSum, extrapolateSum
      integer n, i
      xlist(11) = 1.25D0
      do 30 i=0,9,1
         xlist(i+1) = i*1.0D0/9
 30   continue
      
      n = 13
      do 40 i=1,11,1
         val1 = partialSum(xlist(i),n)
         val2 = extrapolateSum(xlist(i),n, seq1, seq2)
         val3 = log(1+xlist(i))
         write (6, 100) val1, val2, val3
 100     format(F14.10, F14.10, F14.10)
 40   continue
      stop
      end
