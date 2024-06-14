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

   Real::t1,t2
   real e, etime, t(2)
   !e = etime(t)         !  Startup etime - do not use result
   print *, 'elapsed:', e, ', user:', t(1), ', sys:', t(2)

   !call cpu_time(t1)

   ez(:)=0.0
   hy(:)=0.0
   !Archivos
   open(unit=1,file='E.txt')
   open(unit=2,file='H.txt')
   open(unit=3,file='T.txt')
   open(unit=4,file='E50.txt')
   open(unit=5,file='Esource.txt')

   !call cpu_time(t1)
   !write(*,*) 'tiempo 1',t1
   ! time
   do qtime = 0, maxTime-1

      ! magnetic field
      do mm = 1, size-1
         hy(mm)=hy(mm)+(ez(mm+1)-ez(mm))/imp0
      end do

      ! electric field
      do mm = 2, size
         ez(mm)=ez(mm)+(hy(mm)-hy(mm-1))*imp0
      end do

      ! node
      !ez(1)=exp((-1*(qtime-30.0)*(qtime-30.0))/100.0)
      ez(1)=exp((-1*(qtime-pos0)*(qtime-pos0))/100.0)
      
      Esource(qtime)=ez(1)

      !print*,qtime,'-',ez(50)

      E50(qtime)=ez(ind)

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

   !call cpu_time(t2)
   !write(*,*) 'tiempo 2',t2
   !print*,'Tiempo de ejecución',t2-t1

   print*,'_____________________________________________________'
   e = etime( t )
   print *, 'elapsed:', e, ', user:', t(1), ', sys:', t(2)


end program FDTD_1D_wave_propa
