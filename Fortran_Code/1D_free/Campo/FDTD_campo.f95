program FDTD_1D_wave_propa
   implicit none

   !Variables y parametros
   Integer,parameter::size=200
   Real,parameter::imp0=377.0, pos0=10.0
   Integer,parameter::ind=1!50 ! indice de tiempo para graficar al punto de propagacion
   Real,dimension(size)::ez,hy
   Integer::qtime,mm
   Integer,parameter::maxTime=250
   Real,dimension(0:maxTime)::E50,Esource
   Real,dimension(0:maxTime,0:size-1)::dataE,dataH

   open(1,file='dataE.txt')
   open(2,file='dataH.txt')
   open(3,file='T.txt')


   ez(:)=0.0
   hy(:)=0.0
   dataE(:,:)=0.0
   dataH(:,:)=0.0

   do qtime = 0, maxTime-1

      ! magnetic field
      do mm = 1, size-1
         hy(mm)=hy(mm)+(ez(mm+1)-ez(mm))/imp0
         dataH(qtime,mm)=hy(mm)
      end do

      ! electric field
      do mm = 2, size
         ez(mm)=ez(mm)+(hy(mm)-hy(mm-1))*imp0
         dataE(qtime,mm-1)=ez(mm)
      end do

      ! node
      ez(1)=exp((-1*(qtime-pos0)*(qtime-pos0))/100.0)

      Esource(qtime)=ez(1)

      E50(qtime)=ez(ind)

   end do

   do mm = 0,maxTime-1
      write(1,*) dataE(mm,:)
      write(2,*) dataH(mm,:)
      write(3,*) mm
   end do

   close(1)
   close(2)
   close(3)

end program FDTD_1D_wave_propa
