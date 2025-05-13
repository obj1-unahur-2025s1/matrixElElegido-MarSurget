 object neo {
    var energia = 100
    method vitalidad() = energia * 0.1
    method esElElegido() = true
    method saltar() {
        energia = energia * 0.5
    }
    method energia() = energia
 } 

 object morfeo{
    var vitalidadActual = 8
    var estadoDescanso = true 
    method esElElegido() = false
    method estaDescansado() = estadoDescanso
    method saltar(){
        // estadoDescanso = !estadoDescanso  // ! not
        estadoDescanso = not estadoDescanso
        vitalidadActual -= 1 //forma 1
        // vitalidadAactual = (vitalidadAactual - 1).max(0) //forma2
    }
    method vitalidad() = vitalidadActual
 }
 
 object trinity{
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}
 }



object nave{
    const pasajeros = #{neo, morfeo, trinity}
    
    method cantidadPasajeros() = pasajeros.size()

    method pasajeroDeMayorVitalidad() = pasajeros.max({p=>p.vitalidad()})  // obtegngo e pasajero que tenga la maxima vitalidad

    method pasajeroDeMenorVitalidad() = pasajeros.min({p=>p.vitalidad()})  // obtegngo e pasajero que tenga la menor vitalidad

    method estaEquilibrada() {
        return self.pasajeroDeMayorVitalidad().vitalidad() <= self.pasajeroDeMenorVitalidad().vitalidad() * 2
    }

    method estaElElegido() = pasajeros.any({p=>p.esElElegido()})

    method chocar(){
        pasajeros.forEach({p=>p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove(neo)
    }
}



