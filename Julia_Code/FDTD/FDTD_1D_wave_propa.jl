#Programa en Julia

import CPUTime


clock1 = time()

tamaño = 200 #size es una palabra reservada
imp0 = 377.0
maxTime = 250

#println(size)

ez = zeros(Float64, tamaño)
hy = zeros(Float64, tamaño)
E50 = zeros(Float64, maxTime)

#println(size(ez))
"""
println(hy)
println(size(hy))
println(hy[1])
"""
#TODO CPU
#variables para medir el CPU maxTime
##
# ¿Como guardar archivos?

# BUCLE 1 qtime - Tiempo

for qtime in 1:(maxTime)
    #println(qtime)

    # BUCLE 2 hy - Magnetic Field
    for mm in 1:(tamaño-1)
        #println(mm)        
        hy[mm] = hy[mm] + (ez[mm+1] - ez[mm]) / imp0
    end
    # BUCLE 3 ez - Electric Field
    for mm in 2:(tamaño)
        ez[mm] = ez[mm] + (hy[mm] - hy[mm-1]) * imp0
    end

    #node
    ez[1] = exp((-1 * (qtime - 30.0) * (qtime - 30.0)) / 100.0)

    E50[qtime] = ez[50]

end

#println(dec(time_ns()))
#Guardando datos

h = open("H.txt", "w") do h
    for i in 1:tamaño
        println(h, hy[i])
    end
end

e = open("E.txt", "w") do e
    for i in 1:tamaño
        println(e, ez[i])
    end
end
t = open("T.txt", "w") do t
    for i in 1:maxTime
        println(t, i)
    end
end
e50 = open("E50.txt", "w") do e50
    for i in 1:maxTime
        println(e50, E50[i])
    end
end

println("Tiempo de ejecución: ",time() - clock1)

#TODO CPU