program FDTD_1D_wave_propa
   implicit none

   !Variables y parametros
   Integer,parameter::size=200
   Real,parameter::imp0=377.0, pos0=30.0,sigma=100.0
   Integer,parameter::ind=50,ind2=20,ind3=30,ind4=40 ! indice de tiempo para graficar al punto de propagacion
   Real,dimension(size)::ez,hy
   Integer::qtime,mm
   Integer,parameter::maxTime=250
   Real,dimension(0:maxTime)::E50,Esource!,E20,E30,E40
   Real,dimension(0:maxTime,0:size-1)::dataE,dataH

   ez(:)=0.0
   hy(:)=0.0
   dataE(:,:)=0.0
   dataH(:,:)=0.0

   !Archivos
   open(1,file='E.txt')
   open(2,file='H.txt')
   open(3,file='T.txt')
   open(4,file='E50.txt')
   open(5,file='Esource.txt')
   open(6,file='E20.txt')
   open(7,file='E30.txt')
   open(8,file='E40.txt')
   open(9,file='Eaux.txt')
   open(10,file='dataE.txt')
   open(11,file='dataH.txt')

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
      !ez(1)=ez(1)+exp((-1*(qtime-pos0)*(qtime-pos0))/100.0)

      ez(ind)=ez(ind)+exp((-1*(qtime-pos0)*(qtime-pos0))/sigma)

      Esource(qtime)=ez(1)

      E50(qtime)=ez(ind)

      dataE(qtime,ind-1)=ez(ind)


      if ( qtime==ind2 ) then
         do mm = 1, size-1
            write(6,*) ez(mm)
         end do
      end if

      if ( qtime==ind3 ) then
         do mm = 1, size-1
            write(7,*) ez(mm)
         end do
      end if

      if ( qtime==ind4 ) then
         do mm = 1, size-1
            write(8,*) ez(mm)
         end do
      end if

      if ( qtime==70 ) then
         do mm = 1, size-1
            write(9,*) ez(mm)
         end do
      end if

   end do

   do mm = 1, size
      write(1,*) ez(mm)
      write(2,*) hy(mm)
   end do

   do qtime = 0,maxTime
      write(3,*) qtime
      write(4,*) E50(qtime)
      write(5,*) Esource(qtime)
   end do

   do mm = 0,maxTime-1
      write(10,*) dataE(mm,:)
      write(11,*) dataH(mm,:)
      
   end do

end program FDTD_1D_wave_propa
