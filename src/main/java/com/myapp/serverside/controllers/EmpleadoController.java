package com.myapp.serverside.controllers;

import com.myapp.serverside.model.Empleado;
import com.myapp.serverside.services.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/empleados")
public class EmpleadoController {
    @Autowired
    private EmpleadoService empleadoService;

    @GetMapping
    public List<Empleado> getEmpleados() {
        return empleadoService.getAllEmpleados();
    }

    @PostMapping
    public Empleado addEmpleado(@RequestBody Empleado empleado) {
        return empleadoService.saveEmpleado(empleado);
    }
}