package com.github.swrh.pk.controllers;

import com.github.swrh.pk.repositories.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(DepartmentController.MAPPING_BASE)
public class DepartmentController {
    public static final String MAPPING_BASE = "departments";

    private final DepartmentRepository departmentRepository;

    @Autowired
    public DepartmentController(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }
}
