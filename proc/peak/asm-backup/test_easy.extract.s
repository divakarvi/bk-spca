        movaps    (%rsp), %xmm0                                
        movaps    16(%rsp), %xmm1                              
        addpd     %xmm1, %xmm0                                 
        movaps    %xmm0, (%rsp)                                

